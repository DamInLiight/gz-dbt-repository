with
    j_finance_pub as (
        select
            finance_days.date_date,
            nb_transactions,
            total_revenue as revenue,
            avg_basket,
            operational_margin,
            (operational_margin - total_ads_cost) as ads_margin,
            total_ads_cost as ads_cost,
            total_impression as ads_impression,
            total_click as ads_click,
            total_purchase_cost as purchase_cost,
            margin,
            total_shipping_fee as shipping_fee,
            total_log_cost as log_cost

        from {{ ref("finance_days") }}
        left join
            {{ ref("int_campaigns_day") }}
            on finance_days.date_date = int_campaigns_day.date_date
    )

select *
from j_finance_pub
where ads_cost is not null
