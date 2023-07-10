with
    rental as (
        select *
        from {{ ref('stg_erp__rental') }}
    )
    , country as (
        select *
        from {{ ref('stg_erp__country') }}
    )
    , customer as (
        select *
        from {{ ref('stg_erp__customer') }}
    )
    , city as (
        select *
        from {{ ref('stg_erp__city') }}
    )
    , address as (
        select *
        from {{ ref('stg_erp__address') }}
    )
    , join_tabelas as (
        select
            rental.rental_id
            , customer.customer_id
            , customer.address_id
            , address.city_id
            , city.country_id
            , country.country
        from rental
        left join customer on rental.customer_id = customer.customer_id
        left join address on customer.address_id = address.address_id
        left join city on address.city_id = city.city_id
        left join country on city.country_id = country.country_id
    )
select *
from join_tabelas