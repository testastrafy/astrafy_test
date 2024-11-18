Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test

### Explanation

For this task, we got the data from two different files that have been loaded into our DBT project as seed files:
- orders_recrutement.csv
- sales_recrutement.csv

After uploading the files into our DBT project I have created multiple models, divided in different stages, that we will use for the different exercises.
The way this is divided is:

- Staging: Where I have "opened" the CSV files. Here you can find the following models:
    - stg_orders_recrutement ( you can also find a .yml file containing a description for the model and the different columns )
    - stg_sales_recrutement ( you can also find a .yml file containing a description for the model and the different columns )

- Intermediate: Where you can find the following models:
    - int_sales_per_order where I have joined the information from the two staging models and will be used in sales_per_order_report ( you can also find a .yml file containing a description for the model and the different columns )
    - int_orders_segmentation_2023 only using information from stg_orders_recrutement which will be used in orders_segmentation_2023_report ( you can also find a .yml file containing a description for the model and the different columns )

- Reporting: Where you can find the following models:
    - sales_per_order_report which I have used to complete Questions 1, 2, 3 and 4.
    - orders_segmentation_2023_report which I have used to complete Question 5 and 6.


Exercice 1:

- The number of total orders for 2023 is 2573. The way we have I have solved this question is by using the following query:

    SELECT 
      COUNT(DISTINCT orders_id) AS total_orders
    FROM `dbt_tastrafy_reporting.sales_per_order_report`
    WHERE DATE_TRUNC(date_date, YEAR) = '2023-01-01';

Exercice 2:

- The way I have solved this execerise is by usingt he following query:

    SELECT 
      DATE_TRUNC(date_date, MONTH)  AS date_month,
      COUNT(DISTINCT orders_id)     AS total_orders
    FROM `dbt_tastrafy_reporting.sales_per_order_report`
    WHERE 
          1=1
      AND DATE_TRUNC(date_date, YEAR) = '2023-01-01'
    GROUP BY 
      date_month
    ORDER BY date_month;

Exercice 3:

- The way I have solved this execerise is by usingt he following query:

    WITH products_per_order AS (
      SELECT
        date_date, 
        orders_id,
        SUM(qty_product) AS total_products
      FROM `dbt_tastrafy_reporting.sales_per_order_report`
      WHERE 
          1=1
      AND DATE_TRUNC(date_date, YEAR) = '2023-01-01'
      GROUP BY 
          date_date,
          orders_id
    )

    SELECT 
      DATE_TRUNC(date_date, MONTH)  AS date_month,
      ROUND(AVG(total_products),3)
    FROM products_per_order
    GROUP BY  
        date_month;

Exercice 4:

All this information can be found in the table `dbt_tastrafy_reporting.sales_per_order_report`

Exercice 5 and 6:

For exercice 5, the logic applied to get the order segmentation can be found in the model int_orders_segmentation_2023.sql inside intermediate folder.
For exercise 6, I have created the model orders_segmentation_2023_report.
