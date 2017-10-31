#!/usr/bin/env bash

reportSaveLocation=$1

if grep -F $'<td><a href="#high">High</a></td><td align="center">0</td>' $reportSaveLocation
then
    passMessage="No high alerts found in results file"
    echo $passMessage
else
    errorMessage="At least one high alert found in results file"
    echo $errorMessage 1>&2
fi
