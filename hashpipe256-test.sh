#!/bin/sh
# This file is part of hashpipe by Andreas Fischer <af@bantuX.org>.
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.

CURDIR=$(dirname "$0")
TARGET="$CURDIR/hashpipe256.sh"

SCRATCH_DIR="/tmp/hashpipe-tests"
SCRATCH_FILENAME="hashpipe-test-output.test"
SCRATCH_FILENAME_HASH="$SCRATCH_FILENAME.sha256"

oneTimeSetUp() {
    mkdir -p "$SCRATCH_DIR"
}

oneTimeTearDown() {
    rm -rf "$SCRATCH_DIR"
}

tearDown() {
    find "$CURDIR" -type f -name "$SCRATCH_FILENAME*" -delete
    find "$SCRATCH_DIR" -type f -name "$SCRATCH_FILENAME*" -delete
}

testRelativeFile() {
    EXPECTED_CONTENT="The quick brown fox jumps over the lazy dog"
    echo -n "$EXPECTED_CONTENT" | "$TARGET" "$SCRATCH_FILENAME"

    assertSame \
      "Failed asserting that the output file contains the expected content" \
      "$EXPECTED_CONTENT" \
      "$(cat "$SCRATCH_FILENAME")"

    assertSame \
      "Failed asserting that the hash file contains the expected content" \
      "d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592  $SCRATCH_FILENAME" \
      "$(cat "$SCRATCH_FILENAME_HASH")"
}

testAbsoluteFile() {
    EXPECTED_CONTENT="The quick brown fox jumps over the lazy dog."
    echo -n "$EXPECTED_CONTENT" | "$TARGET" "$SCRATCH_DIR/$SCRATCH_FILENAME"

    assertSame \
      "Failed asserting that the output file contains the expected content" \
      "$EXPECTED_CONTENT" \
      "$(cat "$SCRATCH_DIR/$SCRATCH_FILENAME")"

    assertSame \
      "Failed asserting that the hash file contains the expected content" \
      "ef537f25c895bfa782526529a9b63d97aa631564d5d789c2b765448c8635fb6c  $SCRATCH_FILENAME" \
      "$(cat "$SCRATCH_DIR/$SCRATCH_FILENAME_HASH")"
}

. "$CURDIR/shunit2-2.1.6/src/shunit2"
