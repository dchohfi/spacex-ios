# Define output file. Change "$PROJECT_DIR/Tests" to your test's root source folder, if it's not the default name.
OUTPUT_FILE="$PROJECT_DIR/DataManagerTests/Classes/Mock/GeneratedMocks.swift"
echo "Generated Mocks File = $OUTPUT_FILE"

# Define input directory. Change "$PROJECT_DIR" to your project's root source folder, if it's not the default name.
INPUT_DIR="$PROJECT_DIR/DataManager/Classes"
echo "Mocks Input Directory = $INPUT_DIR"

# Generate mock files, include as many input files as you'd like to create mocks for.
${PODS_ROOT}/Cuckoo/run generate --testable "$PROJECT_NAME" \
--output "${OUTPUT_FILE}" \
"$INPUT_DIR/Protocol.swift" \
# ... and so forth

# After running once, locate `GeneratedMocks.swift` and drag it into your Xcode test target group.

# Remove timestamps from OUTPUT_FILE
sed -i '' -e 's/.swift at .*$/.swift/' ${OUTPUT_FILE}
