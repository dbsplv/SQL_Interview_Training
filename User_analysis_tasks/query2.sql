select 
    vendor.vendor_name,
    count(orders.order_id) as orders_count
from orders

right join
        vendor
            on orders.vendor_id = vendor.vendor_id

group by
    vendor.vendor_id,
    vendor.vendor_name