{{
    config(
        materialized = 'incremental',
        unique_key='surrogate_key',
        partition_by={"field": "date_date", "data_type": "DATE"},
        cluster_by=["client_id", "transaction_id", "products_id"], 
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

{% if is_incremental() %}
    WHERE date_date > (SELECT MAX(date_date) FROM {{ this }})
{% endif %}
