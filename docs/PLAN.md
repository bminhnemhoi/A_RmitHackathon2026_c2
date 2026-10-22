# C2 Plan — team Fprinciples (deadline 18:00 VN, 22/10/2026)

## Roles
| Who | Responsibility |
|---|---|
| **Web-1** (lead, form gatekeeper) | TideCloak/Forseti setup, Tide accounts, encrypt/decrypt + quorum integration, API, merges PRs, submits the form |
| **Web-2** (product/story) | Idea brainstorm, UI pages, seed data, README overview (≤ 300 words), demo script, recording + editing video |
| ML-1 / ML-2 (from 16:30) | Fresh-clone QA, act as bidders/admins in the video |

## Timeline
| Time | Web-1 | Web-2 | Gate |
|---|---|---|---|
| 10:45–11:45 | Docker + TideCloak up, run the quickstart, complete Tide enrolment, first login works | Read IDEA.md, ask Hackbot, prepare scoring matrix | Login works locally |
| **11:45** | — | — | **Idea locked** (scored with rubric weights; must pass the "ordinary login + RBAC?" test) |
| 11:45–12:15 | Verify the risky Tide behaviours listed in IDEA.md §5.6 | Static UI for all screens | Go / fallback decision by 12:15 |
| 12:15–14:30 | Real encrypt/decrypt + policy + quorum flow | API + seed data + countdown/comparison UI | — |
| 14:30 | Internal end-to-end demo #1 | | Everything on `main` |
| 14:30–15:45 | Insider/override screen, polish, bug fixes | README overview + Setup, DEMO_SCRIPT final | **Feature freeze 15:45** |
| 15:45–16:45 | Support recording, fix blocking bugs only | Record (OBS, 1080p) → edit → `ffmpeg` compress | Video ≤ 2:00, < 100 MB |
| 16:45–17:15 | Fresh clone on another laptop, follow README exactly | Word-count README, check links/badge | DoD checklist in AGENTS.md all ticked |
| 17:15–17:40 | Tag `v1.0-submission`, confirm repo public, **submit Google Form**, screenshot confirmation | | Form sent |
| 17:40– | **No more pushes** | | |

## Video compression
```bash
ffmpeg -i raw.mp4 -vf "scale=-2:720" -c:v libx264 -preset slow -crf 28 -c:a aac -b:a 96k -movflags +faststart Video.mp4
```
Check: `ffprobe -v error -show_entries format=duration,size -of default=nw=1 Video.mp4`.

## Fallbacks
| Problem | Fallback |
|---|---|
| Forseti / staging network unstable > 45 min | `npm init @tidecloak/nextjs@latest` + real QEA + `_tide_<tag>` E2EE; any mocked part is labelled "mocked" in README |
| Tide enrolment link expired | re-run the initializer, open the link within 5 min |
| MCP not connecting | use docs.tide.org + quickstart; MCP is optional |
| Live demo breaks during recording | record each scene separately and cut together |
