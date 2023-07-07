with
    source_staff as (
        select
            cast(staff_id as int) as staff_id
            , cast(last_name as string) as last_name
            , cast(first_name as string) as first_name
            , cast(first_name || ' ' || last_name as string) as full_name
            , cast(store_id as int) as store_id
        from {{ source('erp', 'staff') }}
    )
select *
from source_staff
