# Terraform AWS Project

Simple Terraform lab with three environments and reusable modules.

- `environments/dev`, `staging`, `prod`: configuration, inputs, outputs, and S3 backend.
- `modules/ec2`: EC2 instance and `scripts/app-install.sh` for Apache setup.
- `modules/security-group`: SSH, HTTP, and HTTPS security-group rules.
- `modules/vpc`, `alb`, `s3`: empty templates for future work; no resources yet.
- `scripts/bootstrap.sh`: initialize an environment.
- `scripts/deploy.sh`: initialize, validate, and apply with Terraform's approval prompt.

## Usage

Configure AWS credentials, then edit the chosen environment's `terraform.tfvars`
and `backend.tf`. The S3 bucket and EC2 key pair must already exist. EC2 currently
uses the default VPC; the VPC, ALB, and S3 templates are not called.

From `Labs/`:

```sh
./scripts/bootstrap.sh dev
terraform -chdir=environments/dev plan
./scripts/deploy.sh dev
```

Replace `dev` with `staging` or `prod` as needed. Each environment has a separate
state key and security-group name. Dev retains the existing `terraform.tfstate`
key; staging and prod use `staging/terraform.tfstate` and `prod/terraform.tfstate`.
No resource migration blocks are included. Existing root-level state addresses
may cause destroy/create actions, so review the plan before applying.

The root `.terraform.lock.hcl` is the shared provider baseline. Bootstrap copies
it into an environment when absent because Terraform reads lock files from its
working directory. Commit generated environment lock files if versions diverge.

The app is available at `http://<instance_public_ip>/app1/` after installation.
User data normally runs on first launch only. Port 443 is allowed, but the script
does not configure HTTPS. Set `ssh_cidr` to your public IPv4 address with `/32`
to restrict SSH. Keep credentials, private keys, and state out of Git.
