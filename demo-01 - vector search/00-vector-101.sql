declare @v1 vector(2) = '[1,1]'
declare @v2 vector(2) = json_array(1,2)

select @v1, @v2

select 
    vector_distance('euclidean', @v1, @v2) as euclidean_distance,
    vector_distance('cosine', @v1, @v2) as cosine_distance
