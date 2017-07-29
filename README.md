## Manual Tasks
1. Create AWS account
2. Generate IAM Admin credential for `terraform`
3. Generate ACM certificate.
3a. MUST BE IN us-east-1! Add domain to requested cert, sends email to domain owner for validation
4. Add the Route53 NS records back to the registars site
5. Subscribe to SNS topic as the validation for email is not supported
6. Enable 'Recieve Billing Alerts' under https://console.aws.amazon.com/billing/home?#/preferences
7. Add circleci-access and circleci-secret to CircleCI build
7a. To expose circleci-secret use: `terraform output circleci-secret | base64 --decode | gpg2 --decrypt`

## TODO:
1. Terraform should manage terraform access keys
2. Create terraform plan only access keys for CircleCI job
3. Use terraform grunt to store remote state
