for /R %DIR% %%f in (*.xls) do ( 
python xls_deploy_tool.py %%~nf xls/%%~nf.xls
protoc tnt_deploy_%%~nf.proto --descriptor_set_out=%%~nf.protodesc
ProtoGen\protogen -i:%%~nf.protodesc -o:%%~nf.cs
)
for /f "delims==" %%a in ('dir /b /s *.cs')do move /-y "%%a" cs
for /f "delims==" %%a in ('dir /b /s *.data')do move /-y "%%a" data
for /f "delims==" %%a in ('dir /b /s *.proto')do move /-y "%%a" proto
pause
