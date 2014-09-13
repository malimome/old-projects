@echo off
copy MSHFLXGD.OCX %sysdir% & MSHFLXGD.OCX
regsvr32 %sysdir% & MSHFLXGD.OCX
echo finished!