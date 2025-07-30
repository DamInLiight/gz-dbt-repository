with
    j_sales_pdt as (
        select
            date_date,
            orders_id,
            stg_raw__sales.products_id,
            revenue,
            quantity,
            stg_raw__product.purchase_price,
            (stg_raw__product.purchase_price * quantity) as purchase_cost
        from {{ ref("stg_raw__sales") }}
        left join
            {{ ref("stg_raw__product") }}
            on stg_raw__sales.products_id = stg_raw__product.products_id
    )

SELECT 
  *, 
  (revenue - purchase_cost) AS margin,
  {{ margin_percent('revenue', 'purchase_cost') }} AS margin_percent
FROM j_sales_pdt