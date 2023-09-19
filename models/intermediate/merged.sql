{{ config(materialized="table", schema="intermediate") }}

select
    cast(to_date("Month", 'MM/DD/YYYY') as datetime) as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator"
from {{ source("sheets", "sheet1") }}
union all
select
    CAST(to_date("Month", 'MM/DD/YYYY') as datetime) as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator"
from {{ source("sheets", "sheet2") }}
