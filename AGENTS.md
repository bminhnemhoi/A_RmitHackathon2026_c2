# AGENTS.md — C2 (Tide UNLOCKED, team Fprinciples)

Rules for every AI coding agent and human on this repo. Team chat in Vietnamese; code, README, video narration in English.

## Read first
1. [docs/CONTEXT.md](docs/CONTEXT.md) — official brief, judging weights, TideCloak cheat-sheet.
2. [docs/IDEA.md](docs/IDEA.md) — candidate ideas, scoring, MVP scope for the chosen idea.
3. [docs/PLAN.md](docs/PLAN.md) — timeline, roles, freeze times.
4. [docs/DEMO_SCRIPT.md](docs/DEMO_SCRIPT.md) — 2-minute video script.
Use the Tide MCP (`tide-pack` in `.mcp.json`) for TideCloak integration questions before guessing APIs.

## Hard constraints
- Deadline **18:00 Vietnam, 22/10/2026**. Feature freeze **15:45**. Form submitted by **17:40**.
  **Nothing is pushed after submission** — the repo must stay identical to the submitted version.
- TideCloak must do real work: the key moment is an admin/insider who **cannot** unilaterally do the sensitive action.
  If a feature is mocked, the README says "mocked" explicitly. Never claim a Tide capability we did not run.
- Synthetic data only. Never commit secrets: `.env*`, real `tidecloak.json` with secrets, admin passwords, tokens.
- Keep the app runnable from a fresh clone by following README → Setup. CI (`npm run build`) must stay green.
- Video `Video.mp4` at repo root, ≤ 2 min, < 100 MB. README overview ≤ 300 words.

## Ownership (avoid conflicts)
| Owner | Paths |
|---|---|
| Web-1 (lead, form gatekeeper) | app logic, auth/crypto integration, API routes, `scripts/`, `.mcp.json`, TideCloak config |
| Web-2 (product/story) | UI components/pages styling, seed data, `README.md`, `docs/`, `Video.mp4` |
| ML-1 / ML-2 (from 16:30) | QA checklist, acting in the video — no code changes without asking the owner |

## Git workflow
- `main` is always runnable. One git worktree per person/agent: `git worktree add ../c2-wt/<topic> -b c2/<topic>`.
- Conventional commits (`feat(c2): …`, `fix(c2): …`, `docs: …`). Squash-merge PRs; Web-1 merges.
- No force-push on `main`. Final commit tagged `v1.0-submission`.

## Definition of done (before the form)
- [ ] Fresh clone → README Setup → login works → main flow works → insider attempt is blocked.
- [ ] `npm run build` passes; no secrets in `git log -p`.
- [ ] README: badge, one sentence, 5 sections ≤ 300 words, Setup, link to `Video.mp4`.
- [ ] `Video.mp4` plays on GitHub, ≤ 2:00, < 100 MB. Repo is public.
