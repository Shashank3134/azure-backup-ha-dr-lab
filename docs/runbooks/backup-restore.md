# Runbook: Azure VM Backup and Restore Validation

## Purpose
Prove that a protected workload can be recovered from an Azure Backup recovery point.

## Preconditions
- A Recovery Services vault and backup policy exist.
- The VM is protected and the initial backup completed.
- You have permission to restore; use a disposable test file or test VM.

## File restore exercise
1. Create a non-sensitive test file, e.g. `/var/tmp/backup-lab-proof.txt`.
2. Add a unique test string and record its checksum.
3. Ensure a recovery point exists after creating the file.
4. Delete or move the test file only after verifying the recovery point.
5. Use the Azure Backup file recovery workflow appropriate to the OS/vault.
6. Restore to a safe alternate path.
7. Compare restored content/checksum with the recorded value.
8. Record job status, recovery point, and duration.

## Optional VM restore
Use the supported portal workflow to restore a VM or disks to alternate resources. Validate boot, network configuration, Nginx, and access.

## Success criteria
Restore job completes, restored data is verified, and evidence is recorded.

## Safety
Never test against production data. Restore may create billable disks, NICs, or VMs. Clean up only after validation.
