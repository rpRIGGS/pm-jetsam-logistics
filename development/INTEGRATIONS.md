# PM Jetsam Logistics — integration notes

## Current baseline

Original source: https://github.com/qbcore-framework/qb-truckerjob

The upstream resource's existing events, callbacks, exports, and configuration remain authoritative until inspected and documented. **No new API names are approved or implemented by this document.**

## Planned connections

pm-shops (shop replenishment); pm-marlowe (wholesale orders and warehouse picking); standard qb-truckerjob routes and callbacks.

## Integration principles

1. Use server-authoritative stock/order updates; no client-only stock adjustments or fulfillment approvals.
2. Prefer documented exports/events or minimal upstream-compatible extensions to fragile direct database writes.
3. Preserve original runtime resource names for drop-in compatibility.
4. Keep Marlowe's production, warehouse bins, cases, pallet records, and sales orders in pm-marlowe; do not duplicate them in the shop/trucking resources.
5. Treat shop restocking and contracted business/event deliveries as different order types sharing a delivery/fulfillment pipeline where appropriate.
6. Require explicit opt-in configuration for PowerMoves-only integrations; no hard dependency on pm-marlowe.

## To verify before coding

- Exact upstream shop stock persistence, delivery completion, and event signatures.
- Installed QBCore and customized qb-inventory behavior on the development server.
- Idempotency, partial fulfillment, offline restocking, and ownership of payment records.
- Receiving location and delivery route configuration, including future Jetsam dispatch.
