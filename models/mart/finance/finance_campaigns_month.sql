select
    extract(month from date_date) as date_month,
    sum(nb_transactions) as nb_transactions,
    sum(revenue) as revenue,
    sum(avg_basket) as avg_basket,
    sum(operational_margin) as op_margin,
    sum(ads_margin) as ads_margin,
    sum(ads_cost) as ads_cost,
    sum(ads_impression) as ads_impression,
    sum(ads_click) as ads_click,
    sum(purchase_cost) as purchase_cost,
    sum(margin) as margin,
    sum(shipping_fee) as shipping_fee,
    sum(log_cost) as log_cost
from {{ ref("finance_campaigns_day") }}
where ads_cost > 0
group by date_month
order by date_month
