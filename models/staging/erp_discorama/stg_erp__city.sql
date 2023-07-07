with
    source_city as (
        select
            cast(city_id as int) as city_id,
            cast(country_id as int) as country_id,
            city.city as city_name
        from {{ source('erp', 'city') }}
    )
select *
from source_city
