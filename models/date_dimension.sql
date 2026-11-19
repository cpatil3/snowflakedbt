with cte as (
    
    Select TO_TIMESTAMP(STARTED_AT) as STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) as DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) as HOUR_STARTED_AT,
    DAYNAME(TO_TIMESTAMP(STARTED_AT)) as DAYNAME,

    {{get_day('STARTED_AT')}} AS DAY_TYPE,

    {{get_season('STARTED_AT')}} AS STATION_OF_YEAR

    FROM {{ source('demo', 'bike') }}
    Where STARTED_AT != 'started_at'

)

Select * from CTE