with
    rental as (
        select *
        from {{ ref('stg_erp__rental') }}
    )
    , customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )
    , join_tabelas as (
        select
            rental.rental_id
            , rental.inventory_id
            , rental.customer_id
            , customer.full_name
        from rental
        left join customer on rental.customer_id = customer.customer_id
    )
select *
from join_tabelas