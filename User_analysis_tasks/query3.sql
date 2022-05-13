select 
    orders.user_id
    
from orders

full outer join
(
    select *
    from orders
    where 
            date = date_trunc('month', (
                    select max(date)
                    from orders
                    ))
        and
            vendor_id = 1
    ) as sq
        on orders.user_id = sq.user_id
where
        orders.user_id is null
    or
        sq.user_id is null