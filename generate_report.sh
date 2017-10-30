#!/usr/bin/env bash

getTimeStamp() {
  date +%s
}

getReportName() {
  timestamp=$(getTimeStamp)
  echo $timestamp".json"
}

target=$1

echo "Scanning site : " $target
reportName=$(getReportName)

docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-weekly zap-baseline.py \
    -t $target -g gen.conf -J $reportName

echo "Saving report : " $reportName

cat $reportName | python -m json.tool > "pretty."$reportName

