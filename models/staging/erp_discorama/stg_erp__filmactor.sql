with
    source_filmactor as (
        select
            cast(film_id as int) as film_id,
            cast(actor_id as int) as actor_id
        from {{ source('erp', 'film_actor') }}
    )
select *
from source_filmactor
