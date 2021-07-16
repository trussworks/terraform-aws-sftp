Creates an AWS Transfer for SFTP endpoint.

Creates the following resources:

* AWS Transfer for SFTP Server.
* IAM role for logging.
* Route53 record for Transfer endpoint (optional).

## Usage

```hcl
module "sftp" {
  source        = "trussworks/sftp/aws"
  version       = "~> 1.0.0"
  name          = "myapp-sftp-endpoint"
  domain_name   = "sftp.example.com"
  iam_role_name = "sftp-logging-role"
  zone_id       = data.aws_route53_zone.main.zone_id
}`
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 2.70 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.70 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| domain\_name | Domain name of the SFTP Endpoint as a CNAME record.  Also requires zone\_id. | `string` | `""` | no |
| iam\_role\_description | Description of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs | `string` | `"IAM Role used by AWS Transfer Server to log to Cloudwatch"` | no |
| iam\_role\_name | Name of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs | `string` | `"sftp-logging-role"` | no |
| name | Name of the AWS Transfer Server | `string` | n/a | yes |
| tags | Additional tags | `map(string)` | `{}` | no |
| zone\_id | Route53 Zone ID of the SFTP Endpoint CNAME record.  Also requires domain\_name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| sftp\_server\_id | Server ID of the AWS Transfer Server (aka SFTP Server) |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
