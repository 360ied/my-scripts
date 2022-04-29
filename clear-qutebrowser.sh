#!/usr/bin/env bash

set -euxo pipefail

rm -rf '~/.cache/qutebrowser'
rm -rf '~/.local/share/qutebrowser/cmd-history'
rm -rf '~/.local/share/qutebrowser/history.sqlite'
rm -rf '~/.local/share/qutebrowser/sessions'
rm -rf '~/.local/share/qutebrowser/webengine'
