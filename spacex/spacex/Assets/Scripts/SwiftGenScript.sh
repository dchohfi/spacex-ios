if which "$PODS_ROOT/SwiftGen/bin/swiftgen" >/dev/null; then
set -e
"$PODS_ROOT/SwiftGen/bin/swiftgen" config run --config "$PROJECT_DIR/spacex/Assets/swiftgen.yml"
else
echo "error: SwiftGen not installed, download it from https://github.com/SwiftGen/SwiftGen"
exit 1
fi
