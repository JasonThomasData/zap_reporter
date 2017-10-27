#!/usr/bin/env bash

getTimeStamp() {
  date +%s
}

getReportName() {
  timestamp=$(getTimeStamp)
  echo $timestamp".json"
}

target=$1

echo $target
reportName=$(getReportName)
echo $reportName

docker run -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-weekly zap-baseline.py \
    -t $target -g gen.conf -J $reportName

