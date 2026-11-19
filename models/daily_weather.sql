with daily_weather as ( 
    Select date(time) as weather_date,
           weather,
           temp,
           pressure,
           humidity,
           clouds
    from {{source('demo', 'weather')}}
),
daily_weather_agg as (
    Select weather_date,
            weather,
            round(avg(temp), 2) avg_temp,
            round(avg(pressure), 2) avg_pressure,
            round(avg(humidity), 2) avg_humidity,
            round(avg(clouds), 2) avg_clouds
           -- count(weather) countw
    from daily_weather
    group by weather_date, weather

    qualify row_number() Over(partition by weather_date order by Count(weather) desc) = 1
)

Select * from daily_weather_agg
