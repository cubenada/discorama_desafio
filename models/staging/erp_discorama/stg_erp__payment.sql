with
    source_payment as (
        select
            cast(payment_id as int) as payment_id,
            cast(customer_id as int) as customer_id,
            cast(staff_id as int) as staff_id,
            cast(rental_id as int) as rental_id,
            payment.amount as amount,
            payment.payment_date as payment_date
        from {{ source('erp', 'payment') }}
    )
select *
from source_payment
