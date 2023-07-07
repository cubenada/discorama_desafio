with
    source_category as (
        select
            cast(category_id as int) as category_id,
            cast(name as string) as category_name
        from {{ source('erp', 'category') }}
    )
select *
from source_category
