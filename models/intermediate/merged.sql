{{ config(materialized="table", schema="intermediate") }}

select * from {{ source("sheets", "sheet1") }}
union all
select * from {{ source('sheets', 'sheet2') }}
