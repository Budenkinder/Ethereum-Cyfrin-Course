#!/usr/bin/env bash
# Provisions the toolchain the Cyfrin Updraft courses assume you have locally:
# Foundry (forge/cast/anvil/chisel) for everything from Foundry Fundamentals on,
# plus Node, which Advanced Foundry uses for the html-fund-me frontend lessons.
set -euo pipefail

FOUNDRY_BIN="${HOME}/.foundry/bin"

echo "==> Installing Foundry"
curl -fsSL https://foundry.paradigm.xyz | bash
"${FOUNDRY_BIN}/foundryup"

# The foundryup installer only appends to the shell profile it detects, so pin
# the PATH entry in both profiles to survive a shell switch inside the container.
for profile in "${HOME}/.bashrc" "${HOME}/.zshrc"; do
  [ -f "${profile}" ] || continue
  grep -q '.foundry/bin' "${profile}" || \
    echo 'export PATH="$PATH:$HOME/.foundry/bin"' >> "${profile}"
done

export PATH="${PATH}:${FOUNDRY_BIN}"

# forge install clones dependencies as git submodules, so a repo must exist
# before the first `forge init`/`forge install` of the course.
if [ ! -d .git ]; then
  echo "==> Initialising git repository"
  git init -q
fi

echo
echo "==> Toolchain ready"
forge --version
cast --version
anvil --version
node --version
