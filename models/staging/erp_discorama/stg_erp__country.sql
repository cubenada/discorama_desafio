with
    source_country as (
        select
            cast(country_id as int) as country_id,
            country.country as country
        from {{ source('erp', 'country') }}
    )
select *
from source_country
