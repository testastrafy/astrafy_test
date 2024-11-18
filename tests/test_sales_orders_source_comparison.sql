
with sales as (
  select distinct
      transaction_id,
      round(sum(turnover), 0) as rounded_turnover
  from `dbt_tastrafy_staging.stg_sales_recrutement`
  group by transaction_id
),

orders as (
  select distinct
      orders_id,
      round(CA_ht, 0) as rounded_ca_ht
  from `dbt_tastrafy_staging.stg_orders_recrutement`
)

-- Find mismatches between the two CTEs
select
    sales.transaction_id as sales_transaction_id,
    orders.orders_id as orders_transaction_id,
    sales.rounded_turnover,
    orders.rounded_ca_ht
from sales
left join
    orders
on
    sales.transaction_id = orders.orders_id
where
    sales.rounded_turnover != orders.rounded_ca_ht
    or orders.orders_id is null  