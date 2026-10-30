
Select * 
From {{ source('demo', 'weather') }}
limit 50