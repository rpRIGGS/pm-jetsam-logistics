# PM Jetsam Logistics — development roadmap

## Baseline

- [ ] Audit the original upstream code and record the exact integration contracts.
- [ ] Preserve the original resource name, public events, callbacks, exports, configuration defaults, and stock behavior.

## Planned PowerMoves enhancements

- [ ] Retain original trucker delivery routes, job flow, and shop restocking.
- [ ] Review existing pickup, route, payout, and delivery completion events before extending.
- [ ] Design optional dispatch requests from Marlowe and other PowerMoves businesses.
- [ ] Support documented delivery destinations: shop location or business/person receiving point.
- [ ] Future Jetsam expansion: route manifests, multi-stop orders, dispatch and proof of delivery; avoid premature rewrites.

## Release checks

- [ ] Existing standard QBCore flows still work with no PowerMoves-only resources installed.
- [ ] Optional integrations fail safely when a peer resource is absent.
- [ ] Server validates inventory, permissions, stock transfers, and fulfillment rather than trusting client messages.
- [ ] Document deployment instructions and compatibility changes before moving to the development server.

Priorities here are exploratory; do not interrupt ongoing pm-marlowe implementation without an explicit development decision.
