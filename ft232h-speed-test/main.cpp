
#include <stdio.h>
#include <time.h>
#include <windows.h>

#include "ftd2xx.h"
#include "types.h"

#pragma comment(lib, "ftd2xx.lib")

// #define DEBUG_READ_COUNTER 1
// #define DEBUG_ERROR_DETAIL 1
// #define DEBUG_BUFFER 1

#define FT_OPENEX 1

int main(void)
{
	printf("UM232H speed test program [Mod by XD v1.3]\n");

	FT_HANDLE ftHandle;

#ifndef FT_OPENEX
	// FT_STATUS ftStatus = FT_Open (0, &ftHandle);
#else
	FT_STATUS ftStatus = FT_OpenEx("UM232H", FT_OPEN_BY_DESCRIPTION, &ftHandle);
#endif

	if (!FT_SUCCESS(ftStatus))
	{
		printf("Unable to open USB device\n");
		return 0;
	}

	FT_Purge(ftHandle, FT_PURGE_RX | FT_PURGE_TX);
	FT_SetBitMode(ftHandle, 0, 0x40); // Single Channel Synchronous 245 FIFO Mode
	FT_SetUSBParameters(ftHandle, 65536, 256);
	FT_SetResetPipeRetryCount(ftHandle, 100);
	FT_SetFlowControl(ftHandle, FT_FLOW_RTS_CTS, 0, 0);	//Required to avoid data loss, see appnote "an_130_ft2232h_used_in_ft245 synchronous fifo mode.pdf"
	FT_SetTimeouts(ftHandle, 500, 0);

	unsigned long start = GetTickCount();
	unsigned long last = start;
	unsigned char buffer[256];
	int filesize = 0;
	int lastSize = 0;
	int errors = 0;
	int lastErrors = 0;
	unsigned char sequence = 0;
	bool initialised = false;
	
	while(true)
	{
		DWORD BytesRead = 0;

		if (FT_Read (ftHandle, buffer, sizeof(buffer), &BytesRead) != FT_OK)
			break;

#ifdef DEBUG_READ_COUNTER
		printf("BytesRead: %d\n", BytesRead);
#endif

		for (uint32_t i = 0; i < BytesRead; i++)
		{
			uint8_t c = buffer[i];
	    	
		    	sequence++;

      	      if (!initialised)
            	{
				sequence = c;
				initialised = true;
			}

			if (c != sequence)
			{
#ifdef DEBUG_ERROR_DETAIL
				printf("Error %d - Actual: %d [%d] %d vs Target: [%d]\n", filesize + i, buffer[i-1], c, buffer[i+1], sequence);
#endif

				errors++;
				sequence = c;
			}
		}


		filesize += BytesRead;
        
		unsigned long current = GetTickCount();

		if (current - last >= 1000)
		{
			double errsec = (double)((double)(errors - lastErrors)) / ((double)(current - last) / 1000) / (double)1000;
			double kbsec = (double) ((double) (filesize - lastSize) / 1024) / ((double) (current - last) / 1000);
			int timepassed = (current - start) / 1000;

			printf("Sec:%d Errors: %d ErrRate: %.1fK/s Size:%.1fMB Rate:%.1fKB/s\n", timepassed, errors, errsec, (double)filesize / (double)1024 / (double)1024, kbsec);
			
#ifdef DEBUG_BUFFER
			for (int i = 0; i < BytesRead; i++)
			{
				if (buffer[i] != buffer[i - 1] + 1)
					printf("[");
				printf(" %d ", buffer[i]);
				if (buffer[i] != buffer[i - 1] + 1)
					printf("]\n");
			}
			printf("\n");
#endif

			fflush(stdout);

			last = current;
			lastSize = filesize;
			lastErrors = errors;
		}
	}

	FT_SetBitMode(ftHandle, 0, 0);

	FT_Close(ftHandle);

	return 0;
}
