with cte as (
    select t.*, w.*
    from {{ref('trip_facts')}} t 
    left join {{ref('daily_weather')}} w on t.trip_date = w.weather_date
)
Select * from cte