# ft232h-core
# Target
I created this project to:  
  1. collect documents and reference designs for FT232H;  
  2. proof of FT232H in sync mode.  
  
# Reason  
I found some open source FT232H sync mode IPs (from opencore, blogs, etc..), but they all seem to lose 1 byte data every 512 bytes on my BeMicro CV + UM232H system.  
After some researching I found that the real timing for FT232H is different from the timing in its datasheet.  
So here's this little project to figure out the real timing for FT232H.  

# Status  
3 sub-projects are completed:  
  1. ft232h-speed-test - VC++ project for PC side, receiving speed counter and error detector;  
  2. ft232h_simple - super simple POC (proof of concept) verilog project for FT232H sync mode;  
  3. ft232h_fifo - coupled FT232H write logic (device to PC) to Altera on-chip DCFIFO IP.  
  
38MByte/sec device to PC transfer speed is archived on my Win10 PC.  
There are always 2 bytes of error at the beginning of transfer, but after that no error is observed.  
Now that's enough for me.
