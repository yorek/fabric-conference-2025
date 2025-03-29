create or alter procedure [dbo].[get_multimodal_embedding]
@text nvarchar(max),
@type varchar(5) = 'text',
@embedding vector(1024) output,
@error nvarchar(max) = null output
as
declare @retval int, @payload nvarchar(max), @response nvarchar(max);
declare @url nvarchar(max)
set @type = lower(trim(@type));

if lower(@type) not in ('text', 'image') begin
    throw 50000, '@type can only be "text" or "image"', 1
end

if @type = 'text' begin
    set @payload = json_object('text': @text)
    set @type = 'Text'
end else begin
    set @payload = json_object('url': @text)
    set @type = 'Image'
end

set @url = '$AIVISION_URL$/computervision/retrieval:vectorize' + @type + '?api-version=2024-02-01&model-version=2023-04-15'

begin try
    exec @retval = sp_invoke_external_rest_endpoint
        @url = @url,
        @method = 'POST',
        @credential = [$AIVISION_URL$],
        @payload = @payload,
        @response = @response output
        with result sets none;
end try
begin catch
    set @error = json_object('error':'Embedding:REST', 'error_code':ERROR_NUMBER(), 'error_message':ERROR_MESSAGE())
    return -1
end catch

if @retval != 0 begin
    set @error = json_object('error':'Embedding:OpenAI', 'error_code':@retval, 'error_message':@response)
    return @retval
end
--select @response;

declare @re nvarchar(max) = json_query(@response, '$.result.vector')
set @embedding = cast(@re as vector(1024));

return @retval
go

