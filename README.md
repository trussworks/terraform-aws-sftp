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
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.70 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.70 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_route53_record.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_transfer_server.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/transfer_server) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.assume_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | Domain name of the SFTP Endpoint as a CNAME record.  Also requires zone\_id. | `string` | `""` | no |
| <a name="input_iam_role_description"></a> [iam\_role\_description](#input\_iam\_role\_description) | Description of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs | `string` | `"IAM Role used by AWS Transfer Server to log to Cloudwatch"` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Name of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs | `string` | `"sftp-logging-role"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the AWS Transfer Server | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Additional tags | `map(string)` | `{}` | no |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | Route53 Zone ID of the SFTP Endpoint CNAME record.  Also requires domain\_name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sftp_server_id"></a> [sftp\_server\_id](#output\_sftp\_server\_id) | Server ID of the AWS Transfer Server (aka SFTP Server) |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
