@echo off
cls
echo This will copy the PDTPicker control to system32 folder and register it.
pause
copy PDTPicker.ocx %systemroot%\system32\PDTPicker.ocx
regsvr32 %systemroot%\system32\PDTPicker.ocx