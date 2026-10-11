#!/bin/sh
# Point Formula/lsty.rb at the latest lsty release.
set -eu
formula=Formula/lsty.rb
tag="$(gh release view --repo skaragianis/lsty --json tagName -q .tagName)"
dir="$(mktemp -d)"
gh release download "$tag" --repo skaragianis/lsty -p SHA256SUMS -D "$dir"
# SHA256SUMS lines are "<sum>  lsty-<tag>-<target>.tar.gz"; the formula
# names the target in each url and its sum on the next sha256 line.
awk -v version="${tag#v}" -v prefix="lsty-$tag-" '
    FNR == NR { t = $2; sub(prefix, "", t); sub(/\.tar\.gz$/, "", t); sum[t] = $1; next }
    /^  version "/ { sub(/"[^"]*"/, "\"" version "\"") }
    /url "/ { t = $0; sub(/.*\}-/, "", t); sub(/\.tar\.gz".*/, "", t) }
    /sha256 "/ {
        if (!(t in sum)) { print "no sum for " t > "/dev/stderr"; exit 1 }
        sub(/"[^"]*"/, "\"" sum[t] "\"")
    }
    { print }
' "$dir/SHA256SUMS" "$formula" > "$dir/lsty.rb"
mv "$dir/lsty.rb" "$formula"
rm -r "$dir"
echo "${tag#v}"
