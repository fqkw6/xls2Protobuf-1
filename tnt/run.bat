for /R %DIR% %%f in (*.xls) do ( 
python xls_deploy_tool.py %%~nf xls/%%~nf.xls
protoc tnt_deploy_%%~nf.proto --descriptor_set_out=%%~nf.protodesc
ProtoGen\protogen -i:%%~nf.protodesc -o:%%~nf.cs
)
pause
