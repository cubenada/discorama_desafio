with
    source_store as (
        select
            cast(store_id as int) as store_id,
            cast(address_id as int) as address_id
        from {{ source('erp', 'store') }}
    )
select *
from source_store
