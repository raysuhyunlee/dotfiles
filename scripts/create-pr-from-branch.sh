#!/usr/bin/env bash
set -euo pipefail

branch="$(git branch --show-current)"
ticket="$(printf '%s' "$branch" | grep -oE '[A-Z]+-[0-9]+')" || {
  echo "JIRA key not found from current branch: $branch" >&2; exit 1; }

summary="$(jira issue view "$ticket" --raw 2>/dev/null || true)"

if [ -n "$summary" ]; then
    summary="$(echo "$summary" | jq -r '.fields.summary')"
fi

title="$ticket"
[ -n "$summary" ] && title="$ticket $summary"

# 필요시 본문 템플릿도 함께
# body_opt=(-F .github/PULL_REQUEST_TEMPLATE.md)
body_opt=()

# Open the browser
echo "gh pr new -w -t \"$title\" ${body_opt[*]}"
gh pr new -w -t "$title" "${body_opt[@]}"
