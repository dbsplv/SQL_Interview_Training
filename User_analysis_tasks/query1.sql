select 
    vendor_id,
    count(user_id) as order_count
from 
    orders
where 
    date =date_trunc('month', (
        select max(date)
        from orders
    ))

group by
    vendor_id
    
order by
    count(user_id) desc
    
limit 10