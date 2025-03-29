declare @retval int, @error nvarchar(max);

declare 
    @dog vector(1536), 
    @cat vector(1536),
    @wolf vector(1536);

exec @retval = dbo.get_embedding 'dog', @dog output, @error output; if @retval != 0 select @retval, @error;
exec @retval = dbo.get_embedding 'cat', @cat output, @error output; if @retval != 0 select @retval, @error;
exec @retval = dbo.get_embedding 'wolf', @wolf output, @error output; if @retval != 0 select @retval, @error;

select
    *
from    
    ( values
        ('dog', 'cat', vector_distance('cosine', @dog, @cat)),
        ('dog', 'wolf', vector_distance('cosine', @dog, @wolf)),
        ('cat', 'wolf', vector_distance('cosine', @cat, @wolf))    
    ) as t (animal1, animal2, distance)
order by
    distance
go