# {{ agent_name }} - {{ use_case_id }}

Agent repository for {{ agent_name }}

## Configuration

- **Agent Name**: {{ agent_name }}
- **Use Case ID**: {{ use_case_id }}
- **Environment**: {{ environment }}
- **Model**: {{ model_name }}
- **Account**: {{ account_number }}
- **Owner**: {{ account_owner }}

## Memory Configuration

- **Type**: {{ memory_type }}
- **Retention Days**: {{ memory_retention_days }}

## Logging Configuration

- **Enabled**: {{ logging_enabled }}
- **Provider**: {{ logging_provider }}
- **Level**: {{ logging_level }}

## Tags

{% for key, value in tags.items() %}
- **{{ key }}**: {{ value }}
{% endfor %}

## Created

- **Date**: {{ created_at }}
- **By**: {{ created_by }}
