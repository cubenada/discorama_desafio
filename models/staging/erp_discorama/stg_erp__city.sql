with
    source_city as (
        select
            cast(city_id as int) as city_id,
            country.country as country_name
        from {{ source('erp', 'city') }}
    )
select *
from source_city
