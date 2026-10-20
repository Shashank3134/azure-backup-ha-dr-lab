# Runbook: Azure Site Recovery Test Failover

## Purpose
Validate secondary-region recovery without interrupting the primary workload.

## Preconditions
- Replication is enabled and healthy.
- A suitable recovery point is available.
- Target network mappings and recovery plan are reviewed.
- An isolated test network exists.
- The current Microsoft Learn workflow for the chosen VM/region has been reviewed.

## Procedure
1. Check replication health and latest recovery point.
2. Start **Test failover** using the selected recovery point and isolated test network.
3. Wait for recovered VMs to boot.
4. Validate VM status, NIC/IP settings, Nginx service, and app response.
5. Record start/end times and any manual steps.
6. Confirm the primary workload remains unaffected.
7. Use the Site Recovery cleanup test failover action.
8. Verify replication remains healthy after cleanup.

## Success criteria
Recovered workload boots and serves the expected app; primary workload remains unaffected; recovery time and blockers are documented; test resources are cleaned up.

## Important
Test failover is not the same as planned/unplanned production failover. Do not initiate actual failover without reviewing impact, recovery plan, DNS/routing, data consistency, and failback.
