{{ config(materialized="table", schema="intermediate") }}

select
    to_timestamp("Month", 'MM/DD/YYYY') as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator"
from {{ source("sheets", "sheet1") }}
union all
select
    to_timestamp("Month", 'MM/DD/YYYY') as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator"
from {{ source("sheets", "sheet2") }}
