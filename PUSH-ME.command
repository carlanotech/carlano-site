#!/bin/bash
#
# ── Carlano site: one-step GitHub push (via GitHub CLI) ───────────────
# Just double-click this file. It will:
#   1. Make sure the GitHub CLI (gh) is installed
#   2. Log you in through your browser (one click, no tokens)
#   3. Push the site to github.com/carlanotech/carlano-site
#   4. Open the Pages settings page so you can flip it live
# ──────────────────────────────────────────────────────────────────────

REPO_URL="https://github.com/carlanotech/carlano-site.git"

cd "$(dirname "$0")" || exit 1

echo "=============================================="
echo " Carlano site → GitHub"
echo "=============================================="
echo ""

# ── 1. Ensure gh (GitHub CLI) is installed ──
if ! command -v gh >/dev/null 2>&1; then
  echo "GitHub CLI (gh) is not installed yet."
  if command -v brew >/dev/null 2>&1; then
    echo "Installing it with Homebrew (this can take a minute)..."
    brew install gh
  else
    echo ""
    echo "Homebrew isn't installed, so I can't auto-install gh."
    echo "Two options:"
    echo "  A) Install Homebrew first (recommended): visit https://brew.sh and paste their one-line command,"
    echo "     then run this script again."
    echo "  B) Download gh directly from https://cli.github.com , install it, then run this script again."
    echo ""
    read -p "Press return to close."
    exit 1
  fi
fi

# ── 2. Log in (only if not already authenticated) ──
if ! gh auth status >/dev/null 2>&1; then
  echo ""
  echo "Let's log you into GitHub. A browser window will open —"
  echo "approve it, and you're set. (Choose HTTPS if asked.)"
  echo ""
  gh auth login --hostname github.com --git-protocol https --web
  if ! gh auth status >/dev/null 2>&1; then
    echo "Login didn't complete. Run the script again to retry."
    read -p "Press return to close."
    exit 1
  fi
fi

# make sure git uses gh's credentials
gh auth setup-git >/dev/null 2>&1

# ── 3. Build the repo & push ──
echo ""
echo "Preparing the files and pushing..."
rm -rf .git
git init -q
git branch -M main
git add -A
git -c user.email="carlanotech@pm.me" -c user.name="Carlano Technology Solutions" \
    commit -q -m "Carlano Technology Solutions LLC — website"
git remote add origin "$REPO_URL"

# Local files are the source of truth; overwrite whatever is on GitHub.
if git push -u --force origin main; then
  echo ""
  echo "────────────────────────────────────────────────────────────"
  echo " Push complete. Final step on GitHub:"
  echo "   Settings → Pages → Source: 'Deploy from a branch'"
  echo "   Branch: main   Folder: / (root)   → Save"
  echo "   Live in ~1 min at:"
  echo "   https://carlanotech.github.io/carlano-site/"
  echo "────────────────────────────────────────────────────────────"
  echo "Opening the Pages settings page..."
  open "https://github.com/carlanotech/carlano-site/settings/pages"
else
  echo ""
  echo "The push failed. Copy the message above and send it to Claude."
fi

echo ""
read -p "Press return to close."
