#!/usr/bin/env bash
set -euo pipefail
for src in "$@"; do
  base="${src%.puml}"
  plantuml -tsvg "$src"
  python3 - "$base.svg" "$base.html" << 'PY'
import re, sys
svg_path, html_path = sys.argv[1], sys.argv[2]
s = open(svg_path, encoding='utf-8').read()
m = re.search(r'width="(\d+)px" height="(\d+)px"', s)
w, h = int(m.group(1)), int(m.group(2))
scale = 3
W, H = w*scale, h*scale
s = re.sub(r'style="width:\d+px;height:\d+px;', f'style="width:{W}px;height:{H}px;', s, count=1)
s = s.replace(f'width="{w}px" height="{h}px"', f'width="{W}px" height="{H}px"', 1)
html = f'''<!DOCTYPE html><html><head><meta charset="utf-8">
<style>@page {{ size: {W}px {H}px; margin: 0; }}
html,body {{ margin:0; padding:0; background:#fff; }}
svg {{ display:block; }}</style></head><body>{s}</body></html>'''
open(html_path, 'w', encoding='utf-8').write(html)
print(W, H)
PY
  google-chrome-stable --headless --disable-gpu --no-sandbox \
    --no-pdf-header-footer --virtual-time-budget=3000 \
    --print-to-pdf="$base.raw.pdf" "file://$(realpath "$base.html")" >/dev/null 2>&1
  pdfcrop --margins "4 4 4 4" "$base.raw.pdf" "$base.pdf" >/dev/null 2>&1
  rm -f "$base.svg" "$base.html" "$base.raw.pdf"
  echo "OK: $base.pdf ($(pdfinfo "$base.pdf" | awk '/Page size/{print $3"x"$5}'))"
done
