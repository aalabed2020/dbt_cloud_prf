{%- set source_model = "v_stg_f4101" -%}
{%- set src_pk = "PRODUCT_PK" -%}
{%- set src_nk = "IMITM","IMLITM" -%}
{%- set src_ldts = "LOAD_DATE" -%}
{%- set src_source = "RECORD_SOURCE" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}