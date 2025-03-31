/*
    Generate save embeddings from *images*
*/

drop table if exists #animals;
create table #animals(id int not null primary key, animal varchar(100), embedding vector(1024))
go

declare @retval int, @error nvarchar(max), @v vector(1024);

exec @retval = dbo.get_multimodal_embedding 'https://github.com/yorek/fabric-conference-2025/blob/main/_assets/dog.jpg?raw=true', 'image', @v output, @error output; if @retval != 0 select @retval, @error;
insert into #animals values (1, 'dog', @v);

exec @retval = dbo.get_multimodal_embedding 'https://github.com/yorek/fabric-conference-2025/blob/main/_assets/cat.jpg?raw=true', 'image', @v output, @error output; if @retval != 0 select @retval, @error;
insert into #animals values (2, 'cat', @v);

exec @retval = dbo.get_multimodal_embedding 'https://github.com/yorek/fabric-conference-2025/blob/main/_assets/wolf.jpg?raw=true', 'image', @v output, @error output; if @retval != 0 select @retval, @error;
insert into #animals values (3, 'wolf', @v);

exec @retval = dbo.get_multimodal_embedding 'https://github.com/yorek/fabric-conference-2025/blob/main/_assets/starfish.jpg?raw=true', 'image', @v output, @error output; if @retval != 0 select @retval, @error;
insert into #animals values (4, 'starfish', @v);
go

select * from #animals;
go

-- Find the right animal from a text description
declare @e vector(1024)
declare @retval int, @error nvarchar(max);
exec [dbo].[get_multimodal_embedding] 'a cute little kitten', 'text', @e output, @error output;
select
    a.*,
    vector_distance('cosine', @e, embedding) as distance
from
    #animals a
order by
    distance
go

-- Find the right animal from a text description
declare @e vector(1024)
declare @retval int, @error nvarchar(max);
exec [dbo].[get_multimodal_embedding] 'wild predator, four-legged furry animal', 'text', @e output, @error output;
select
    a.*,
    vector_distance('cosine', @e, embedding) as distance
from
    #animals a
order by
    distance
go

-- Find the right animal from another picture
declare @e vector(1024)
declare @retval int, @error nvarchar(max);
exec [dbo].[get_multimodal_embedding] 'https://github.com/yorek/fabric-conference-2025/blob/main/_assets/starfish_drawing.jpg?raw=true', 'image', @e output, @error output;
select
    a.*,
    vector_distance('cosine', @e, embedding) as distance
from
    #animals a
order by
    distance
go


