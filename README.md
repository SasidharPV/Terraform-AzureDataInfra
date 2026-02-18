# Databricks + ADF Platform Terraform

This repo scaffolds Azure data platform infrastructure with Terraform and Azure DevOps. Stacks are split by domain (network, identity, monitoring, purview, adf, databricks) and parameterized per environment via `envs/{dev|qa|prod}`.

## Layout
- `stacks/<stack>`: Terraform for each domain; run `terraform -chdir=stacks/<stack>`.
- `envs/<env>/<stack>.tfvars`: per-env inputs.
- `envs/<env>/backend.hcl`: sample remote backend config.
- `pipelines/azure-devops/terraform-pipeline.yml`: Azure DevOps template used by `azure-pipelines.yml`.

## Usage
1. Update tfvars with real IDs (subscriptions, RGs, subnets, AAD group object IDs, KV/Storage IDs).
2. Ensure backend storage exists; enable soft delete + versioning.
3. Run locally (example):
   ```bash
   terraform -chdir=stacks/network init -backend-config=../../envs/dev/backend.hcl
   terraform -chdir=stacks/network plan -var-file=../../envs/dev/network.tfvars
   ```
4. Azure DevOps: create variable groups `vg-dev`, `vg-qa`, `vg-prod` with `backend_rg`, `backend_sa`, `backend_container` (and secrets). Use branch `dev|qa|prod` to target each env.

## Notes
- Providers use AAD auth; service connection needs contributor on target RGs and directory read access.
- Databricks provider uses `workspace_resource_id` (set after workspace creation) or defaults to workspace from azurerm resource.
- Add private endpoints, DNS zones, and stricter cluster policies as needed.
