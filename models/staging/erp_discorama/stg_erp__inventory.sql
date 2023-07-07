with
    source_inventory as (
        select
            cast(inventory_id as int) as inventory_id,
            cast(film_id as int) as film_id,
            cast(store_id as int) as store_id
        from {{ source('erp', 'inventory') }}
    )
select *
from source_inventory