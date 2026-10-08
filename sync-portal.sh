#!/usr/bin/env bash
# Syncs HTML artefacts from telmex-adp into the GitHub Pages portal.
# Run from the telmex-presentations root after generating new files in telmex-adp.
set -euo pipefail

SRC="/Users/dmurcia/telmex-adp"
PRES="canales-digitales/2026-10-07-arquitecturas"

echo "Syncing from $SRC..."

# docs/
cp "$SRC/docs/catalogo-demo-SDCAPISF.html"          "$PRES/"
cp "$SRC/docs/catalogo-demo.html"                   "$PRES/"

# arquitectura-canales-digitales.html — requiere fix de rutas:
# el original apunta a ../.archify/subfolder/archivo.html (válido en telmex-adp)
# en el portal todos los archivos viven en el mismo directorio → rutas planas
cp "$SRC/docs/arquitectura-canales-digitales.html" "$PRES/"
python3 - <<'PYEOF'
import sys
f = "canales-digitales/2026-10-07-arquitecturas/arquitectura-canales-digitales.html"
paths = [
    ("../.archify/sequence-curp-identity/curp-identity.html",     "sequence-curp-identity.html"),
    ("../.archify/sequence-option1-sdcapi/option1-sdcapi.html",   "sequence-option1-sdcapi.html"),
    ("../.archify/sequence-option2-async/option2-async.html",     "sequence-option2-async.html"),
    ("../.archify/architecture-opt1/architecture-opt1.html",      "architecture-opt1.html"),
    ("../.archify/architecture-opt2-v2/architecture-opt2.html",   "architecture-opt2-v2.html"),
    ("../.archify/sequence-tmf699-lead/tmf699-lead.html",         "sequence-tmf699-lead.html"),
    ("../.archify/sequence-live-opt1/live-opt1.html",             "sequence-live-opt1.html"),
    ("../.archify/sequence-live-opt2/live-opt2.html",             "sequence-live-opt2.html"),
]
with open(f) as fh: html = fh.read()
for old, new in paths: html = html.replace(old, new)
with open(f, "w") as fh: fh.write(html)
print("  ✓ rutas de iframes corregidas en arquitectura-canales-digitales.html")
PYEOF

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
