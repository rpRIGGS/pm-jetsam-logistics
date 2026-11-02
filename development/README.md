# PM Jetsam Logistics — PowerMoves RP development

This repository is a PowerMoves RP-specific fork of [qbcore-framework/qb-truckerjob](https://github.com/qbcore-framework/qb-truckerjob). The fork exists solely to add server-specific integrations while retaining the upstream QBCore resource's core behavior.

## Compatibility contract

- GitHub repository branding does **not** change the FiveM runtime resource name. Keep the original resource folder and event/export names for drop-in use.
- Preserve upstream configuration, user-facing behavior, dependencies, attribution, and license.
- Add features in a backward-compatible, opt-in manner wherever possible. Standard QBCore operation must not require PowerMoves-only resources.
- PowerMoves RP uses QBCore, qb-target, and a customized drag-and-drop qb-inventory replacement that preserves QBCore compatibility; ox_lib may be used when needed. Do not introduce ox_target or ox_inventory dependencies.
- Validate changes against the installed server versions before declaring compatibility; the fork itself does not guarantee tested drop-in behavior.

## Scope

store restock deliveries, assigned routes, pickup/receiving points, commercial distribution, and future Jetsam business operations.

Documentation in this folder is planning/reference material, not a claim that the integrations are already implemented.

## Current development status

The trucker fork now includes grade-based Jetsam access, per-model vehicle appearance, Mule6, LC Fuel, checkout deposits, a preparation interval, revised delivery compensation, government tax posting and companion shop integration. The implementation has not been tested on a FiveM server. See the development changelog for amounts and integration details. Future dispatch, logistics management and Marlowe connections remain deferred.
