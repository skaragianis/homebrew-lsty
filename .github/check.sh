#!/bin/sh
# Install the formula from the committed tap, then test and audit it.
set -eu
brew tap skaragianis/lsty "$PWD"
brew install skaragianis/lsty/lsty
brew test skaragianis/lsty/lsty
brew audit --strict skaragianis/lsty/lsty
