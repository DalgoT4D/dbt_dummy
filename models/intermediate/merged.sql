{{ config(materialized="table", schema="intermediate") }}


with
    merged as (
        select
            "Month" as "month",
            "ngo",
            "spoc",
            "measure",
            "Indicator" as "indicator"
        from {{ source("sheets", "sheet1") }}
        union all
        select
            "Month" as "month",
            "ngo",
            "spoc",
            "measure",
            "Indicator" as "indicator"
        from {{ source("sheets", "sheet2") }}
    )

    
