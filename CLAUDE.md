# EllesmereUI Project Context

## What This Project Is
EllesmereUI is a fork of a WoW UI addon. Cole (cdreier02) is the project manager, not the repo owner of the upstream. This fork is being used to trial a bug tracking and project management workflow before rolling it out to the main repo (~10 volunteer devs, 50-100 open bugs).

## Bug Tracking Workflow (Being Set Up)
We are building a GitHub-based bug tracking system to replace a fragmented process (Discord, Google Sheets, WoW forums). The pipeline:

1. **Intake**: Bug reports arrive via Discord (captured by elle-bot), WoW/CurseForge forums, or GitHub Issues directly
2. **Auto-creation**: elle-bot creates GitHub Issues automatically from Discord reports
3. **Auto-categorization**: Bot applies category labels via Claude API call (area:frames, area:combat, area:settings, etc.)
4. **Dedup flagging**: Bot compares new issues against existing open issues in same category via Claude API, flags potential duplicates for human review
5. **Triage**: Cole reviews, confirms/adjusts labels, sets priority (p1-critical, p2-important, p3-minor), merges dupes, cleans up descriptions, moves to Ready
6. **Dev claims**: Volunteer dev self-assigns from the Ready column on the GitHub Projects board
7. **Dev works**: Only ask is including `fixes #N` in commit/PR message
8. **Merge**: Lead dev reviews and merges PRs. Auto-closes issue, workflow moves it to Needs Verification
9. **Verification**: Community testers confirm fix works in-game, then move to Done

## GitHub Projects Board Columns
- Triage → Ready → In Progress → Needs Verification → Done

## Labels (created via setup-labels.sh)
### Category
area:frames, area:combat, area:settings, area:visual, area:performance, area:api, area:other

### Priority
p1-critical, p2-important, p3-minor

### Workflow
triage, needs-info, duplicate, needs-verification, confirmed-fixed, wontfix, upstream

### Source
source:discord, source:forum, source:github

## Files Already Created
- `setup-labels.sh` — gh CLI script to create all labels on the repo
- `.github/ISSUE_TEMPLATE/bug_report.yml` — structured bug report form
- `.github/workflows/issue-automation.yml` — Actions workflow for auto-adding issues to project board, labeling needs-verification on PR merge, auto-closing duplicates

## Setup Progress
- [x] Files created (labels script, issue template, Actions workflow)
- [x] gh CLI installed and working on Mac
- [x] Labels created on repo
- [x] GitHub Project board created with correct columns (project #3)
- [x] PROJECT_NUMBER and PROJECT_OWNER configured in workflow
- [x] Classic PAT created with repo + project scopes
- [x] PAT added as PROJECT_TOKEN repo secret
- [x] Branch protection rule on main (require PR, 1 approval)
- [ ] Test: create issue from template → verify triage label + board placement
- [ ] Test: create branch, PR with "fixes #1", merge → verify needs-verification label
- [ ] Test: push directly to main → verify it's blocked

## Key Design Principles
- Volunteer devs must have MINIMAL overhead — the only ask is `fixes #N` in commits
- Cole absorbs all triage/documentation work
- GitHub Issues is the single source of truth
- Discord stays as public intake channel only, not for tracking
- Google Sheet becomes read-only archive

## Technical Context
- Cole's machine: 2019 MacBook Pro, macOS, zsh shell
- GitHub username: cdreier02
- Repo: cdreier02/EllesmereUI
- Bot infrastructure: elle-bot on Oracle Cloud VM
- Cole is comfortable with Python, Git, GitHub, Claude API
