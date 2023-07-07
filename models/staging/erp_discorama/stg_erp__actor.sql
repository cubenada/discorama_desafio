with
    source_actor as (
        select
            cast(actor_id as int) as actor_id
            , cast(last_name as string) as last_name
            , cast(first_name as string) as first_name
            , cast(first_name || ' ' || last_name as string) as full_name
        from {{ source('erp', 'actor') }}
        order by actor_id
    )
select *
from source_actor