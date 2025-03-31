declare @ret int, @response nvarchar(max);
declare @payload nvarchar(max) = N'{
    "text": "The people were delighted, coming forth to claim their prize They ran to build their cities and converse among the wise But one day, the streets fell silent, yet they knew not what was wrong The urge to build these fine things seemed not to be so strong The wise men were consulted and the Bridge of Death was crossed In quest of Dionysus to find out what they had lost"
}';

exec @ret = sp_invoke_external_rest_endpoint
    @url =  N'$CONTENTSAFETY_URL$/contentsafety/text:detectProtectedMaterial?api-version=2024-02-15-preview',
    @method = 'POST',
    @credential = [$CONTENTSAFETY_URL$],
    @payload = @payload,
    @response = @response output;

if (@ret=0)
    select 
        * 
    from 
        openjson(@response, '$.result');

select @ret as ReturnCode, @response as Response;

