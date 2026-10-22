# C2 Context — Tide "UNLOCKED" (Challenge 2)

> Single source of truth for Challenge 2. Collected 2026-10-22 from https://tide.org/unlocked/#challenge,
> the organiser slides and docs.tide.org. Idea analysis lives in [IDEA.md](IDEA.md).

## 1. Brief
**"What would you build if trust stopped being the bottleneck?"** Build a small working prototype with
**TideCloak integrated** where **no single administrator, organisation or AI can unilaterally override** the rules
protecting people's data and decisions. Demonstrate **one** new possibility and explain why removing unilateral
control makes it possible. Synthetic data and mocked systems are allowed. A finished product is not required.

> ⚠️ "If your app would work exactly the same with ordinary login and backend permissions, develop the idea further.
> TideCloak should change what it can credibly do."
> FAQ: don't make it mainly a login demo, a security tool or a generic access-control dashboard.

**Emergent Authority:** authority for an action with no master key to keep — it only emerges when the right
identity, policy and approvals line up (Tide's ORK network splits the capability).

## 2. Deadline & submission
| Item | Value |
|---|---|
| Deadline | **Thu 22/10/2026 18:00 Vietnam** (= Fri 23/10 10:00 AEDT) |
| Form | https://forms.gle/HRHYjnqB86j1LFS97 — group name `RMIT_<CAMPUS>_Fprinciples_C2` (**confirm campus**) |
| Repo | this repo, **public**; **must not be modified after the deadline** (submitted version is judged) |
| README | badge + one-sentence description + 5 prompts below, **≤ 300 words**; setup in a separate section |
| Video | **2-minute `.mp4` inside the repo, < 100 MB** (GitHub file limit) |

Badge: `[![Built with TideCloak](https://tide.org/badges/built-with-tidecloak.svg)](https://tide.org/tidecloak?utm_source=github&utm_medium=readme&utm_campaign=unlocked)`

Suggested video structure: **The possibility → The constraint → The prototype (working + TideCloak's role) → What changes.**

## 3. Judging (judges read the README overview alongside the demo)
| Weight | Criterion | README prompt |
|---:|---|---|
| 25% | Vision & originality | What new product, service, experience or way of working are you proposing? What makes your idea distinctive? |
| 20% | Trust constraint insight | What is difficult, risky or impossible today because trust, privacy or security gets in the way? What becomes possible when that constraint is removed? |
| 20% | Value & impact | Who would benefit, and how would their lives or work improve? Give a concrete example. |
| 20% | Why TideCloak matters | How does the app use TideCloak, and how does that integration enable the idea? |
| 15% | Prototype & storytelling | What does the prototype demonstrate today? Which key interaction should judges look for? |

The 12 official example ideas (avoid copying): Care Passport, Research Consent Vault, Rental Application Passport,
Blind Portfolio Review, Unreleased, Supplier Evidence Exchange, Matter Room, Dual-Control Expense Desk,
Guild Treasury, Coalition Intel Exchange, CreatorVault, Community Ballot.

## 4. TideCloak cheat-sheet (verify against docs before relying on it)
| Capability | API / mechanism | Status |
|---|---|---|
| Login (BYOiD, zero-knowledge) | React: `useTideCloak()` → `login`, `logout`, `authenticated`; JS: `IAMService.doLogin()` | real |
| Roles from token | `hasRealmRole(role)`, `hasClientRole(role, client)`, `getValueFromIdToken(key)` | real |
| Self E2EE | `doEncrypt([{data, tags}])`, `doDecrypt([{encrypted, tags}])`; roles `_tide_<tag>.selfencrypt/.selfdecrypt` | real |
| Shared E2EE by policy | `doEncrypt(items, policyBytes)` / `doDecrypt(items, policyBytes)` (forseti-crypto-quickstart) | real (staging) |
| Forseti policy + time-lock | C# `IAccessPolicy` contract, tag `DecryptTimeLock:{epoch}`; lifecycle Create → Approve → Commit | real in quickstart — **verify tag binding** |
| Quorum-Enforced Governance (QEA/IGA) | admin changes return `202` PENDING → approve in tide-console "QEA Approvals"; threshold `max(1, floor(0.7×N))` → need **3 admins** for 2-of-3 | real |
| M-of-N user signatures for decrypt | Forseti EXPLICIT approvals | **unverified — do not promise** |
| AI agent with its own Tide identity / headless signing | — | **not available** |

Guard components (React): `<Authenticated>`, `<Unauthenticated>`. Default redirect `${origin}/auth/redirect`.
Setup trap: assign all user roles **before** adding the 2nd/3rd admin — afterwards every role change needs quorum.

## 5. Tooling
- **Tide MCP (Raziel)** for Claude Code — already configured in [`.mcp.json`](../.mcp.json) (`npx -y @tideorg/mcp`);
  remote endpoint `https://mcp.tide.org/mcp`. Read-only guidance tools (`tide_choose_playbook`, `tide_playbook`,
  `tide_choose_scenario`, `tide_security_analysis`).
- **Quickstart (plan B):** `docker run -d --name mytidecloak -p 8080:8080 -e KC_BOOTSTRAP_ADMIN_USERNAME=admin -e KC_BOOTSTRAP_ADMIN_PASSWORD=password tideorg/tidecloak-dev:latest`
  then `npm init @tidecloak/nextjs@latest my-app` (creates realm, IdP, license, first admin, enables QEA;
  pauses for a manual Tide enrolment link that expires in ~5 min). App on :3000, console on
  `http://localhost:8080/realms/<realm>/tide-console/`.
- **Forseti base:** https://github.com/tide-foundation/forseti-crypto-quickstart (`template-ts-app`, Next 16 + SQLite,
  image `tideorg/tidecloak-stg-dev`). Its `init/*.sh` scripts use `sudo`/bash/jq → on Windows run in Git Bash without
  `sudo` or WSL2 (WSL is not installed on the lead's machine). No licence file — credit it in the README.
- Help: Hackbot (on the challenge page), Tide Discord `#support`.

## 6. Tech decisions
- Base = whichever the team locks at 11:45 (recommended in IDEA.md: fork `forseti-crypto-quickstart` for SealedBid).
- Synthetic data only, no real personal data. Secrets (`tidecloak.json` with client secrets, `.env`) are not committed;
  publish `*.example` files instead.
