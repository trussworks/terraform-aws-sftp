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

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| aws | >= 2.70 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.70 |

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
| certificate | The Amazon Resource Name (ARN) of the AWS Certificate Manager (ACM) certificate. | `string` | `null` | no |
| domain\_name | Domain name of the SFTP Endpoint as a CNAME record.  Also requires zone\_id. | `string` | `""` | no |
| endpoint\_details | The virtual private cloud (VPC) endpoint settings that you want to configure for your SFTP server. Only required if endpoint\_type is set to VPC. | ```map(object({ address_allocation_ids = list(string) subnet_ids = list(string) vpc_id = string security_group_ids = list(string) }))``` | `{}` | no |
| endpoint\_type | The type of endpoint that you want your SFTP server connect to. Either PUBLIC or VPC. | `string` | `"PUBLIC"` | no |
| host\_key | RSA private key (e.g., as generated by the ssh-keygen -N "" -m PEM -f my-new-server-key command). | `string` | `null` | no |
| iam\_role\_description | Description of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs | `string` | `"IAM Role used by AWS Transfer Server to log to Cloudwatch"` | no |
| iam\_role\_name | Name of the AWS Transfer Server IAM Role used for logging to CloudWatch Logs | `string` | `"sftp-logging-role"` | no |
| name | Name of the AWS Transfer Server | `string` | n/a | yes |
| protocols | Specifies the file transfer protocol or protocols over which your file transfer protocol client can connect to your server's endpoint. | `list(string)` | ```[ "SFTP" ]``` | no |
| security\_policy\_name | Specifies the name of the security policy that is attached to the server. | `string` | `"TransferSecurityPolicy-2020-06"` | no |
| tags | Additional tags | `map(string)` | `{}` | no |
| zone\_id | Route53 Zone ID of the SFTP Endpoint CNAME record.  Also requires domain\_name. | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| sftp\_server\_endpoint | The endpoint of the Transfer Server |
| sftp\_server\_id | Server ID of the AWS Transfer Server (aka SFTP Server) |
<!-- END_TF_DOCS -->
