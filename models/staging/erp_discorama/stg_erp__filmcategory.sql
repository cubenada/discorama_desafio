with
    source_filmcategory as (
        select
            cast(film_id as int) as film_id,
            cast(category_id as int) as category_id
        from {{ source('erp', 'film_category') }}
    )
select *
from source_filmcategory