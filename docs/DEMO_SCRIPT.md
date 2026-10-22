# Demo video script — 2:00 max (`Video.mp4`, < 100 MB)

Structure required by Tide: **The possibility → The constraint → The prototype (and TideCloak's role) → What changes.**
Below is the draft for the recommended idea (SealedBid, see IDEA.md §6). Rewrite it if the team locks a different idea.

| Time | Part | On screen | Narration (EN) |
|---|---|---|---|
| 0:00–0:20 | Possibility | Title, three small bidders | "What if a two-person company could bid for a public contract knowing that nobody — not the official, not the platform, not us — can see any price before the deadline?" |
| 0:20–0:45 | Constraint | Diagram: bids → server → admin 👀 | "Every e-tender today has a custodian. Whoever holds the bids can peek and leak a rival's price. Small firms assume the game is rigged and stay out." |
| 0:45–1:35 | Prototype + TideCloak | 1) bidder seals & submits (ciphertext receipt) · 2) officer clicks *Open early* → red ORK error · 3) DB dump = ciphertext only · 4) officer adds himself to the committee → tide-console shows PENDING 1/2 · 5) deadline hits → committee opens all envelopes → ranking | "Bids are encrypted in the bidder's browser with TideCloak. A quorum-approved Forseti policy, enforced by Tide's independent ORK network, refuses decryption before the deadline and to anyone outside the committee. Our server stores only ciphertext. Hung is an administrator, yet he can't open early, and his attempt to join the committee waits for two of three admins." |
| 1:35–2:00 | What changes | Closing line + Built with TideCloak badge | "Administration is no longer authority. Fair competition becomes a property of the system, not a promise." |

## Recording checklist
- [ ] Separate Chrome profiles per user, logged in before recording; zoom 125 % for readability.
- [ ] Deadline in seed = now + 4 min when recording the "open after deadline" scene.
- [ ] Mic check; narration recorded separately if the room is noisy.
- [ ] Final cut ≤ 2:00; compress with the ffmpeg command in PLAN.md; play it back from GitHub after pushing.
