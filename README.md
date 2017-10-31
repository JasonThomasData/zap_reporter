These two bash scripts will use Owasp's Zap to do some basic security tests. It covers some, but not
all, of the Owasp Top Ten.

# Use

To generate a report for a website:

    ./generate_report.sh <URL> 

That creates a report with a timestamp like `reports/1532131321.html`

To check the report:

    ./check_fail.sh reports/1532131321.html

That program will exit with status of 1 if there is an issue.

# Requirements

Docker
