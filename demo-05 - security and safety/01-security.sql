if not exists(select * from sys.symmetric_keys where [name] = '##MS_DatabaseMasterKey##')
begin
    create master key encryption by password = N'V3RYStr0NGP@ssw0rd!';
end
go

if exists(select * from sys.[database_scoped_credentials] where name = '$CONTENTSAFETY_URL$')
begin
	drop database scoped credential [$CONTENTSAFETY_URL$];
end
go

create database scoped credential [$CONTENTSAFETY_URL$]
--with identity = 'HTTPEndpointHeaders', secret = '{"api-key":"$CONTENTSAFETY_KEY$"}'; -- best pratice is to use Managed Identity if you can
with identity = 'Managed Identity', secret = '{"resourceid":"https://cognitiveservices.azure.com"}';
go

