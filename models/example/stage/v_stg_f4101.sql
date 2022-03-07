{%- set yaml_metadata -%}
source_model: 'raw_f4101'
derived_columns:
  RECORD_SOURCE: '!RAW_F4101'
  LOAD_DATE: DATEADD(DAY, 1, TRANSACTION_DATE)
  EFFECTIVE_FROM: 'TRANSACTION_DATE'
hashed_columns:
  PRODUCT_PK:
    - 'IMITM'
    - 'IMLITM'
  PRODUCT_HASHDIFF:
    is_hashdiff: true
    columns:
      - 'RAW_DATA'
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}