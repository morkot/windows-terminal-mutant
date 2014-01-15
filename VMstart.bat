@ECHO OFF

SET VMNAME="%1"
SET isVMRun=

IF [%1] == [] (
  echo Empty parameter VMNAME. Usage: %0 [name of vm]
  EXIT /B 1
)

FOR /F %%i IN ('VBoxManage list runningvms') DO SET isVMRun=%%i

IF NOT "%isVMRun%" == "%VMNAME%" (
 Vboxmanage startvm %VMNAME% --type headless
)