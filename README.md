# Static Websites Terraform

This repository contains all of the various pieces of Terraform code used to 
configure and provision out the required infrastructure to host static websites
for my personal blogs/sites. 

## Initial Manual Tasks
1. Install [`terraform`](https://learn.hashicorp.com/terraform/getting-started/install.html)
2. [Create an AWS account](https://aws.amazon.com/premiumsupport/knowledge-center/create-and-activate-aws-account/).
3. [Generate IAM Admin credentials](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html) for a `terraform` user.
4. Execute `terraform apply`
4. Add the Route53 NS records back to the registars site
5. Subscribe to SNS topic as the validation for email is not supported
6. Enable 'Recieve Billing Alerts' under https://console.aws.amazon.com/billing/home?#/preferences
7. Add circleci-access and circleci-secret to CircleCI build
7a. To expose circleci-secret use: `terraform output circleci-secret | base64 --decode | gpg2 --decrypt`
