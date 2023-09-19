{{ config(materialized="table", schema="prod") }}

select 
    "spoc",
    "ngo",
    "indicator", 
    to_timestamp("month", 'MM/DD/YYYY') as "month",
    TO_CHAR(to_timestamp("month", 'MM/DD/YYYY'), 'Month') as "month_slug",
    cast(regexp_replace("measure", ',', '', 'g') as float) as measure,
    CASE "indicator"
    WHEN '# of service contacts at NGO partners clinics' THEN '# of service contacts'
    WHEN '# of youth (15-25 years) accessing reproductive health services (PBG Indicator, reported quarter basis)' THEN '# of youth'
    WHEN '# of newborns born in supported clinics and catchment area receiving immediate newborn care (within 72 hours)' THEN '# of newborns'
    WHEN '# of children less than 12 months of age who received DPT3/Penta3 from USG-supported programs' THEN '# of children'
    WHEN '# of injectables provided through USG supported program to prevent unintended pregnancies' THEN '# of injectables'
    ELSE ''
    END as "indicator_slug",
    "quarter"
from {{ ref('merged') }}
where indicator in (
    '# of service contacts at NGO partners clinics', 
    '# of youth (15-25 years) accessing reproductive health services (PBG Indicator, reported quarter basis)',
    '# of newborns born in supported clinics and catchment area receiving immediate newborn care (within 72 hours)',
    '# of children less than 12 months of age who received DPT3/Penta3 from USG-supported programs',
    '# of injectables provided through USG supported program to prevent unintended pregnancies'
    )