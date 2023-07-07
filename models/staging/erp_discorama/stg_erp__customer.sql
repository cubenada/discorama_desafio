with
    source_customer as (
        select
            cast(customer_id as int) as customer_id,
            cast(first_name || ' ' || last_name as string) as full_name,
            cast(first_name as string) as first_name,
            cast(last_name as string) as last_name,
            cast(address_id as int) as address_id
        from {{ source('erp', 'customer') }}
    )
select *
from source_customer
