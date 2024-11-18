{{
    config(
        materialized = 'table',
        enabled = true
    )
}}


WITH orders_history AS (
  SELECT DISTINCT
    date_date,
    customers_id,
    orders_id,
    ROW_NUMBER() OVER (PARTITION BY customers_id ORDER BY date_date desc) AS orders_sorted
  FROM {{ ref('stg_orders_recrutement') }}
),

final as (
  SELECT 
    o1.date_date,
    o1.customers_id,
    o1.orders_id,
    SUM(CASE WHEN o2.date_date BETWEEN DATE_SUB(o1.date_date, INTERVAL 12 MONTH) AND DATE_SUB(o1.date_date, INTERVAL 1 DAY) THEN 1 ELSE 0 END) AS last_year_orders
  FROM orders_history o1
  LEFT JOIN {{ ref('stg_orders_recrutement') }} o2
    ON o1.customers_id = o2.customers_id
  GROUP BY o1.date_date, o1.customers_id, o1.orders_id
)

SELECT 
  date_date,
  customers_id,
  orders_id,
  CASE
    WHEN last_year_orders = 0 THEN 'New'
    WHEN last_year_orders BETWEEN 1 AND 3 THEN 'Returning'
    WHEN last_year_orders >= 4 THEN 'VIP'
  END AS order_segmentation
FROM final
WHERE DATE_TRUNC(date_date, YEAR) = '2023-01-01'