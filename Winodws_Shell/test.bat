@echo off / echo hello world
net  stop ATFM_UMP_Client
timeout /t 3 /nobreak > nul 
D:
cd D:\AppDeploy\UMP-Client\bin\config
copy client_datacollect_SL.properties client_datacollect.properties
timeout /t 3 /nobreak > nul  
net  start ATFM_UMP_Client
pause