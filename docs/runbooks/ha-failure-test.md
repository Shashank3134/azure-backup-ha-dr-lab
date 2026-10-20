# Runbook: High-Availability Backend Failure Test

## Purpose
Validate that the Load Balancer stops routing traffic to an unhealthy backend while another backend remains healthy.

## Preconditions
- Terraform deployment is complete.
- Both VMs show healthy in the Load Balancer backend health view.
- Public frontend responds.
- This is a lab environment, not production.

## Procedure
1. Capture a baseline HTTP response from the Load Balancer frontend.
2. Confirm both backend instances are healthy.
3. Stop one backend VM from Azure Portal or CLI.
4. Wait for the probe to mark it unhealthy.
5. Send repeated requests to the frontend.
6. Confirm the surviving backend returns a valid Nginx response.
7. Start the stopped VM and wait for it to return to healthy.
8. Capture evidence and record any observed interruption.

## Success criteria
- The surviving backend remains healthy and serves the app.
- The unhealthy backend is removed from eligible traffic.
- The recovered backend returns to healthy status.

## Cleanup
Start any VM stopped for the test. Verify both backends and frontend are healthy. Do not claim zero downtime unless measured.
