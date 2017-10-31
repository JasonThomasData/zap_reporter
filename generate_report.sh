#!/usr/bin/env bash

docker pull owasp/zap2docker-stable

getReportName() {
  timestamp=$(date +%s)
  echo $timestamp".html"
}
reportName=$(getReportName)
reportSaveLocation="reports/"$reportName

target=$1 # ./generate_report.sh <URL>
echo "Scanning site : "$target

docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-weekly zap-baseline.py \
    -t $target -g gen.conf -r $reportSaveLocation

echo "Saving report :" $reportSaveLocation

