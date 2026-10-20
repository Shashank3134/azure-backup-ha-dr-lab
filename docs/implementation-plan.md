# Implementation Plan

Complete the stages in order. Verify current regional support and cost before provisioning resources.

## Stage 0 — Plan
- [ ] Select primary and secondary Azure regions.
- [ ] Verify VM SKU, image, zone, Site Recovery support, and quotas.
- [ ] Define lab RPO/RTO and create a budget alert.
- [ ] Prepare an SSH public key; keep the private key local.

## Stage 1 — HA web tier
- [ ] Sign in with Azure CLI and select the intended subscription.
- [ ] Review `terraform/variables.tf`; set a unique prefix, region, and SSH public key.
- [ ] Run `terraform init`, `terraform fmt`, `terraform validate`, and `terraform plan`.
- [ ] Inspect the plan, then apply only when the resource list is expected.
- [ ] Verify Nginx on both VMs and the Load Balancer frontend.
- [ ] Stop one backend VM and confirm the other serves traffic; start it again.

## Stage 2 — Azure Backup
- [ ] Create a Recovery Services vault in the primary region.
- [ ] Configure backup policy and retention appropriate for the lab.
- [ ] Enable backup for each VM and verify initial backup jobs.
- [ ] Create a harmless test file, ensure a recovery point includes it, then test restore.
- [ ] Record job status, recovery point, validation, and duration.

## Stage 3 — Monitoring
- [ ] Create a Log Analytics workspace.
- [ ] Configure Azure Monitor alerts for relevant VM metrics and availability signals.
- [ ] Configure backup and Site Recovery health monitoring where supported.
- [ ] Add an Action Group notification endpoint you control.
- [ ] Trigger a safe test alert and record delivery evidence.

## Stage 4 — Disaster recovery
- [ ] Configure Site Recovery and a target network in a supported secondary region.
- [ ] Enable replication for supported VMs and verify replication health/recovery points.
- [ ] Review recovery plan steps and network mappings.
- [ ] Run **Test failover** into an isolated test network.
- [ ] Validate boot, Nginx, network connectivity, and application response.
- [ ] Clean up the test failover using the supported workflow.
- [ ] Record measured recovery time and any blockers; plan failback separately.

## Stage 5 — Portfolio polish and cleanup
- [ ] Add sanitized screenshots under `docs/evidence/`.
- [ ] Complete `docs/test-plan.md` with real results.
- [ ] Update README with verified outcomes only.
- [ ] Destroy unneeded lab resources and review vault-protected items/retained data separately.

## Cost warning
Compute, disks, public IP, Load Balancer, Backup storage, Site Recovery, Log Analytics ingestion, and related resources may incur charges. Check the Azure Pricing Calculator and clean up after testing.
