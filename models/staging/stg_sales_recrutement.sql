{{
    config(
        materialized = 'table',
        enabled = true,
        persist_docs={"relation": true, "columns": true}
    )
}}

SELECT 
      {{ dbt_utils.generate_surrogate_key(['date_date', 'transaction_id', 'products_id']) }} AS surrogate_key
    , date_date
    , client_id
    , transaction_id
    , products_id
    , turnover
    , qty               AS total_products
FROM {{ ref('sales_recrutement') }}
