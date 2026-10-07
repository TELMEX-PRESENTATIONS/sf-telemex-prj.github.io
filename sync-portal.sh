#!/usr/bin/env bash
# Syncs HTML artefacts from telmex-adp into the GitHub Pages portal.
# Run from the telmex-presentations root after generating new files in telmex-adp.
set -euo pipefail

SRC="/Users/dmurcia/telmex-adp"
PRES="canales-digitales/2026-10-07-arquitecturas"

echo "Syncing from $SRC..."

# docs/
cp "$SRC/docs/arquitectura-canales-digitales.html"  "$PRES/"
cp "$SRC/docs/catalogo-demo-SDCAPISF.html"          "$PRES/"
cp "$SRC/docs/catalogo-demo.html"                   "$PRES/"

# .archify/
cp "$SRC/.archify/architecture-opt1/architecture-opt1.html"           "$PRES/architecture-opt1.html"
cp "$SRC/.archify/architecture-opt2-v2/architecture-opt2.html"        "$PRES/architecture-opt2-v2.html"
cp "$SRC/.archify/architecture-telmex-opt2/architecture-opt2.html"    "$PRES/architecture-telmex-opt2.html"
cp "$SRC/.archify/sequence-curp-identity/curp-identity.html"          "$PRES/sequence-curp-identity.html"
cp "$SRC/.archify/sequence-live-opt1/live-opt1.html"                  "$PRES/sequence-live-opt1.html"
cp "$SRC/.archify/sequence-live-opt2/live-opt2.html"                  "$PRES/sequence-live-opt2.html"
cp "$SRC/.archify/sequence-option1-sdcapi/option1-sdcapi.html"        "$PRES/sequence-option1-sdcapi.html"
cp "$SRC/.archify/sequence-option2-async/option2-async.html"          "$PRES/sequence-option2-async.html"
cp "$SRC/.archify/sequence-tmf699-lead/sequence-tmg699-lead.html"     "$PRES/sequence-tmf699-lead.html" 2>/dev/null || true
cp "$SRC/.archify/workflow-user-journey/user-journey.html"            "$PRES/workflow-user-journey.html"

echo "Sync complete. Stage and push:"
echo "  git add -A && git commit -m 'sync: update presentations' && git push"
