#!/bin/sh

# License: CC0

timeshift() {
    # git internal format (e.g. "@1439045814 +0900")
    local GIT_TIMESTAMP=$1
    # `date` relative items (e.g. "+1 hour")
    local TIMEDIFF=$2

    # remove time zone offset
    local EPOCH=$(echo "$GIT_TIMESTAMP" | cut -d " " -f 1)

    # convert epoch seconds into RFC2822
    # because `date` doesn't support relative items with epoch
    local RFC2822=$(date --date="$EPOCH" --rfc-2822)

    # shift date
    date --date="$RFC2822 $TIMEDIFF" --rfc-2822
}

TIMEDIFF=$1

export GIT_AUTHOR_DATE=$(timeshift "$GIT_AUTHOR_DATE" "$TIMEDIFF")
export GIT_COMMITTER_DATE=$(timeshift "$GIT_COMMITTER_DATE" "$TIMEDIFF")
