declare @ret int, @response nvarchar(max);
declare @payload nvarchar(max) = N'{
    "text": "I am going to kill all the ants in my house"
}';

exec @ret = sp_invoke_external_rest_endpoint
    @url =  N'https://mladscontentsafety.cognitiveservices.azure.com/contentsafety/text:analyze?api-version=2023-10-01',
    @method = 'POST',
    @credential = [https://mladscontentsafety.cognitiveservices.azure.com],
    @payload = @payload,
    @response = @response output;

if (@ret=0)
    select 
        * 
    from 
        openjson(@response, '$.result.categoriesAnalysis') with 
            (category nvarchar(100), severity decimal(10,2));

select @ret as ReturnCode, @response as Response;

