select
    extract(month from date_date) as date_month,
    round(sum(nb_transactions), 2) as nb_transactions,
    round(sum(revenue), 2) as revenue,
    round(sum(avg_basket), 2) as avg_basket,
    round(sum(operational_margin), 2) as op_margin,
    round(sum(ads_margin), 2) as ads_margin,
    round(sum(ads_cost), 2) as ads_cost,
    round(sum(ads_impression), 2) as ads_impression,
    round(sum(ads_click), 2) as ads_click,
    round(sum(purchase_cost), 2) as purchase_cost,
    round(sum(margin), 2) as margin,
    round(sum(shipping_fee), 2) as shipping_fee,
    round(sum(log_cost), 2) as log_cost
from {{ ref("finance_campaigns_day") }}
where ads_cost > 0
group by date_month
order by date_month
