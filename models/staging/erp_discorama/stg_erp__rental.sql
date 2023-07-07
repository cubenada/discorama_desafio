with
    source_rental as (
        select
            cast(rental_id as int) as rental_id,
            cast(inventory_id as int) as inventory_id,
            cast(customer_id as int) as customer_id,
            cast(staff_id as int) as staff_id,
            rental.rental_date as rental_date,
            rental.return_date as return_date
        from {{ source('erp', 'rental') }}
    )
select *
from source_rental
