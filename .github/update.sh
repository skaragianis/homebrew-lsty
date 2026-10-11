#!/bin/sh
# Point Formula/lsty.rb at the latest lsty release.
set -eu
formula=Formula/lsty.rb
tag="$(gh release view --repo skaragianis/lsty --json tagName -q .tagName)"
dir="$(mktemp -d)"
gh release download "$tag" --repo skaragianis/lsty -p SHA256SUMS -D "$dir"
# SHA256SUMS lines are "<sum>  lsty-<tag>-<target>.tar.gz"; each url in the
# formula names a target, and its sum is on the next sha256 line.
awk -v tag="$tag" '
    FNR == NR { t = $2; sub("^lsty-" tag "-", "", t); sub(/\.tar\.gz$/, "", t); sum[t] = $1; next }
    /url "/ {
        t = ""
        for (k in sum) if (index($0, "-" k ".tar.gz\"")) t = k
        if (t == "") { print "no sum for " $0 > "/dev/stderr"; exit 1 }
        sub(/download\/.*"/, "download/" tag "/lsty-" tag "-" t ".tar.gz\"")
    }
    /sha256 "/ { sub(/"[^"]*"/, "\"" sum[t] "\"") }
    { print }
' "$dir/SHA256SUMS" "$formula" > "$dir/lsty.rb"
mv "$dir/lsty.rb" "$formula"
rm -r "$dir"
echo "${tag#v}"
