# PM Jetsam Logistics — development changelog

## Initial documentation

- Added PowerMoves RP development notes and baseline compatibility rules.
- Recorded roadmap and planned integration boundaries.
- No gameplay code, resource names, events, callbacks, exports, or configuration values changed.

Future entries should record meaningful behavior changes, their compatibility impact, and any required deployment steps.

## Jetsam driver economy and vehicle checkout (2026-11-02)

- Grade 6+ Jetsam drivers may check out configured vehicles; `mule6` replaces `mule5`.
- Per-model livery, colors, extras, fuel level and LC Fuel integration.
- $125 refundable vehicle checkout deposit; bank refund after depot return.
- Five-minute server-enforced truck preparation queue with ready notification.
- Maximum 20 unique delivery stops, $15 per stop, 20% bonus at 5+ stops, 15% income tax.
- Tax is deposited to the `sagov` society key via qb-banking (matches development-jobs.lua); failed tax transfers block payout.
- Server maintains route drop counts, validates assigned shop keys and proximity against qb-shops server config, and restricts payslip claims to the depot.
- Companion `pm-shops` changes expose delivery-stop lookup and restocking exports, and restore the shop-list event. Deploy both updated forks together.
- No client-triggered qb-shops restock payout is used for Jetsam runs.
- This is code-level integration, not FiveM runtime-tested. Client-side box progress remains a gameplay action and cannot independently prove completion to an adversarial client.
