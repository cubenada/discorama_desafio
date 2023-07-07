with
    source_film as (
        select
            cast(film_id as int) as film_id,
            cast(title as string) as title,
            cast(rental_duration as int) as rental_duration,
            film.rental_rate as rental_rate,
            film.replacement_cost as replacement_cost
        from {{ source('erp', 'film') }}
    )
select *
from source_film
