{{ config(materialized='view') }}
with source_data as (

select IMITM,IMLITM,TO_VARIANT(OBJECT_CONSTRUCT_KEEP_NULL(*)) AS RAW_DATA, Getdate() AS TRANSACTION_DATE FROM "PRFR_DEV_SANDBOX"."PRFR_BRONZE_JDE_SCH"."F4101"

)

select *
from source_data

