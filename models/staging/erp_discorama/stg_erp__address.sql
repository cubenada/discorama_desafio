with
    source_address as (
        select
            cast(address_id as int) as address_id,
            cast(city_id as int) as city_id,
            address.address as address
        from {{ source('erp', 'address') }}
    )
select *
from source_address
