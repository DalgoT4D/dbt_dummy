{{ config(materialized="table", schema="intermediate") }}

select
    "Month" as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator",
    "quarter" as "Q1"
from {{ source("sheets", "sheet1") }}
union all
select
    "Month" as "month",
    "ngo",
    "spoc",
    "measure",
    "Indicator" as "indicator",
    "quarter" as "Q2"
from {{ source("sheets", "sheet2") }}


