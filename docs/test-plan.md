# Test Plan and Results

Record actual results; do not mark a test passed until it has been performed.

| ID | Scenario | Procedure | Expected result | Status | Evidence / notes |
|---|---|---|---|---|---|
| HA-01 | Normal traffic | Request the public LB frontend | Nginx page responds | Not run | |
| HA-02 | Backend VM stopped | Stop one backend VM | Remaining healthy backend serves requests | Not run | |
| HA-03 | Backend recovers | Start stopped VM and wait for probe | Backend returns healthy | Not run | |
| BAK-01 | Initial backup | Run/inspect backup job | Job succeeds | Not run | |
| BAK-02 | File restore | Restore a test file from a valid recovery point | Restored content matches expected value | Not run | |
| DR-01 | Replication health | Inspect Site Recovery health and recovery point | Replication healthy | Not run | |
| DR-02 | Test failover | Recover to isolated test network | VM boots and app is reachable | Not run | |
| MON-01 | Alert delivery | Trigger safe test condition | Action Group notification arrives | Not run | |
| COST-01 | Cleanup | Remove lab resources and inspect vault items | Unneeded resources removed; retained items reviewed | Not run | |

## Recovery measurements

| Metric | Target | Observed | How measured |
|---|---|---|---|
| RPO | Define before test | Not measured | Difference between latest recoverable point and disruption |
| RTO | Define before test | Not measured | Incident declaration to validated service |
| Restore duration | Define before test | Not measured | Restore job start to validation |
| Alert delivery | Define before test | Not measured | Trigger to notification receipt |

## Evidence checklist
Store sanitized screenshots or notes in `docs/evidence/`. Redact subscription IDs, tenant IDs, public IPs, email addresses, secrets, and identifying resource names.
