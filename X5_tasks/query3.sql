select 
    client_id,
    sum(session_time) as client_total_time

from 
    data


group by 
    client_id

order by
    client_total_time desc

limit 10