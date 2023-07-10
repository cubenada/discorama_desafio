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
    , film_actor as (
        select *
        from {{ ref('stg_erp__filmactor') }}
    )
    , actor as (
        select *
        from {{ ref('stg_erp__actor') }}
    )
    , rental_per_actor as (
        select DISTINCT
            rental.rental_id
            , inventory.film_id
            , CASE WHEN actor.actor_id IS NULL THEN '000' ELSE CAST(actor.actor_id AS STRING) END AS actor_id
            , films.title as film_name
            , CASE WHEN actor.full_name IS NULL THEN 'NO ACTOR' ELSE CAST(actor.full_name AS STRING) END AS actor_name
        from rental
        left join inventory on rental.inventory_id = inventory.inventory_id
        left join films on inventory.film_id = films.film_id
        left join film_actor on films.film_id = film_actor.film_id
        left join actor on film_actor.actor_id = actor.actor_id
    )
    , chave_rental_actor as (
        select
            cast((rental_id || '-' || actor_id) as string) as rental_actor_pk
            , *
        from rental_per_actor
    )    
select *
from chave_rental_actor