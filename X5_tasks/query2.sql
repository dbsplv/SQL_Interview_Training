select 
    date,
    DAU,
    100 * ( cast(DAU as float ) /cast( PreviousDayDAU as float )  - 1) as prev_change
from (
        select 
            date,
            count(distinct client_id) as DAU,
            LAG ( count(distinct client_id), 1, 0 ) OVER ( 
                ORDER BY date 
                )      as PreviousDayDAU
        From
            data


        Group by
            date

        ORDER BY date
) as sq    
    

    
    