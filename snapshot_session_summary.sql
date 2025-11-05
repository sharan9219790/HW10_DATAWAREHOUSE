{% snapshot snapshot_session_summary %}
{{
  config(
    target_database=target.database,
    target_schema=target.schema,
    unique_key="user_id || '-' || to_char(week_start, 'YYYY-MM-DD') || '-' || coalesce(channel,'')",
    strategy='check',
    check_cols=['week_start','user_id','channel']
  )
}}
select * from {{ ref('session_summary') }}
{% endsnapshot %}
