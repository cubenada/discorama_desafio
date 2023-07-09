with
    rental as (
        select *
        from {{ ref('stg_erp__rental') }}
    )
    , store as (
        select *
        from {{ ref('stg_erp__store') }}
    )
    , inventory as (
        select *
        from {{ ref('stg_erp__inventory') }}
    )
    , join_tabelas as (
        select
            rental.rental_id
            , rental.inventory_id
            , store.store_id
        from rental
        left join inventory on rental.inventory_id = inventory.inventory_id
        left join store on inventory.store_id = store.store_id
    )
select *
from join_tabelas