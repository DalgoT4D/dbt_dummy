{{ config(materialized="table", schema="intermediate") }}

select *
from {{ source("sheets", "sheet1") }}
