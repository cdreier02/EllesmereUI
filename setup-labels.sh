#!/bin/bash
# Creates all labels for EllesmereUI bug tracking workflow
# Usage: ./setup-labels.sh

REPO="cdreier02/EllesmereUI"

# Category labels
gh label create "area:frames"      --repo "$REPO" --color "1d76db" --description "Unit frames, party frames, target frames" --force
gh label create "area:combat"      --repo "$REPO" --color "d93f0b" --description "Combat, cooldowns, auras, procs" --force
gh label create "area:settings"    --repo "$REPO" --color "0e8a16" --description "Options, profiles, presets" --force
gh label create "area:visual"      --repo "$REPO" --color "f9d0c4" --description "Glows, widgets, cursor, nameplates" --force
gh label create "area:performance" --repo "$REPO" --color "fbca04" --description "FPS drops, memory, load times" --force
gh label create "area:api"         --repo "$REPO" --color "5319e7" --description "WoW API changes, compatibility" --force
gh label create "area:other"       --repo "$REPO" --color "ededed" --description "Anything not covered above" --force

# Priority labels
gh label create "p1-critical" --repo "$REPO" --color "b60205" --description "Crashes, broken core features" --force
gh label create "p2-important" --repo "$REPO" --color "ff9f1c" --description "Significant bugs, high impact" --force
gh label create "p3-minor"    --repo "$REPO" --color "c2e0c6" --description "Low impact, cosmetic, nice-to-fix" --force

# Workflow labels
gh label create "triage"             --repo "$REPO" --color "d4c5f9" --description "Needs review and categorization" --force
gh label create "needs-info"         --repo "$REPO" --color "cc317c" --description "Waiting on reporter for more details" --force
gh label create "duplicate"          --repo "$REPO" --color "cfd3d7" --description "Duplicate of another issue" --force
gh label create "needs-verification" --repo "$REPO" --color "0075ca" --description "Fix merged, waiting for tester confirmation" --force
gh label create "confirmed-fixed"    --repo "$REPO" --color "2ea44f" --description "Fix verified in-game by tester" --force
gh label create "wontfix"            --repo "$REPO" --color "ffffff" --description "Not a bug or intentional behavior" --force
gh label create "upstream"           --repo "$REPO" --color "bfdadc" --description "Bug in upstream repo, not our fork" --force

# Source labels
gh label create "source:discord" --repo "$REPO" --color "5865f2" --description "Reported via Discord" --force
gh label create "source:forum"   --repo "$REPO" --color "e4e669" --description "Reported via WoW/CurseForge forums" --force
gh label create "source:github"  --repo "$REPO" --color "333333" --description "Reported directly on GitHub" --force

echo "All labels created successfully!"
