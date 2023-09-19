{{ config(materialized="table", schema="intermediate") }}

select
    "Month" as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator",
    'Q1' as "quarter"
from {{ source("sheets", "sheet1") }}
union all
select
    "Month" as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator",
    'Q2' as "quarter"
from {{ source("sheets", "sheet2") }}


