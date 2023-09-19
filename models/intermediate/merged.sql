{{ config(materialized="table", schema="intermediate") }}

select
    to_date("Month", 'MM/DD/YYYY') as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator"
from {{ source("sheets", "sheet1") }}
union all
select
    to_date("Month", 'MM/DD/YYYY') as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator"
from {{ source("sheets", "sheet2") }}