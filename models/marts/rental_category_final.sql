with
    rental as (
        select *
        from {{ ref('stg_erp__rental') }}
    )
    , inventory as (
        select *
        from {{ ref('stg_erp__inventory') }}
    )
    , films as (
        select *
        from {{ ref('stg_erp__films') }}
    )
    , category as (
        select *
        from {{ ref('stg_erp__category') }}
    )
    , film_category as (
        select *
        from {{ ref('stg_erp__filmcategory') }}
    )
    , join_tabelas as (
        select
            rental.rental_id
            , rental.inventory_id
            , inventory.film_id
            , film_category.category_id
            , films.title
            , category.category_name
        from rental
        left join inventory on rental.inventory_id = inventory.inventory_id
        left join films on inventory.film_id = films.film_id
        left join film_category on films.film_id = film_category.film_id
        left join category on film_category.category_id = category.category_id
    )
select *
from join_tabelas