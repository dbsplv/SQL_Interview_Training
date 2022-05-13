select
    *
from
(

        select 
            date_trunc('month', date),
            vendor_id,
            count(order_id),
            rank() OVER w as rnk

        from
            orders

        where
            date::date between (
                select 
                    max(date)::date
                from orders
            ) -365 and (
                select 
                    max(date)::date
                from orders
            ) 

        group by
            date_trunc('month', date),
            vendor_id

        window w as  
        (
            partition by date_trunc('month', date)

            order by count(order_id) desc

        )
) as sq

where 
    rnk<4