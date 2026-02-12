# Terraform configuration for {{ agent_name }}
# Generated: {{ created_at }}

terraform {
  required_version = ">= 1.0"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  
  default_tags {
    tags = {
      Agent       = "{{ agent_name }}"
      UseCaseId   = "{{ use_case_id }}"
      Environment = "{{ environment }}"
      ManagedBy   = "Terraform"
      CreatedBy   = "{{ created_by }}"
      {% for key, value in tags.items() %}
      {{ key }} = "{{ value }}"
      {% endfor %}
    }
  }
}

# Bedrock Agent Configuration
resource "aws_bedrockagent_agent" "main" {
  agent_name              = "{{ agent_name }}"
  agent_resource_role_arn = aws_iam_role.agent_role.arn
  foundation_model        = "{{ model_name }}"
  
  description = "Agent for {{ use_case_id }}"
  
  tags = {
    Name = "{{ agent_name }}"
  }
}

# IAM Role for Agent
resource "aws_iam_role" "agent_role" {
  name = "{{ agent_name }}-agent-role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "bedrock.amazonaws.com"
        }
      }
    ]
  })
}
