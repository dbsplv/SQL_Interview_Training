select
        user_id,
        revenue,
        total_revenue,
        share,
        sum(share) over (order by user_id) as cum_sum

from (
    select
        user_id,
        revenue,
        sum(revenue) over () as total_revenue,
        100* revenue / sum(revenue) over () as share
    from
    (
        select 
            orders.user_id as user_id ,
            sum(vendor.take_rate) as revenue

        from 
            orders

        join vendor
            on orders.vendor_id = vendor.vendor_id

        group by
            orders.user_id



        order by 
            orders.user_id
    )  as sq
) as sq
