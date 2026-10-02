# COMP347 Project 1 Report

This repository is my submission for COMP347 project 1 hosted publicly on Github.
This project contains a short summary of each report inside of [./report.md](./report.md)
which can be used to generate a docx through [pandoc](http://pandoc.org/).

You can also view the report in [docx format from the following file](./report.docx)

## About the Reports
You can find all related reports for the assignment inside of [./csv_files/](./csv_files/);
Since the assignment refers to them vaguely as:

- report 1
- report 2
- report 3
- ...

I had opted to name them more verbosely; Below is a table of the mappings to
each report and their respective file:

### Mappings to assignment reports

|Report name (as referred to in assignment)| File name in ./csv_files                                                     |
|------------------------------------------|------------------------------------------------------------------------------|
|Report 1                                  | [accepted.csv](./csv_files/accepted.csv)                                     |
|Report 2                                  | [failed.csv](./csv_files/failed.csv) + [invalid.csv](./csv_files/invalid.csv)|
|Report 3                                  | [failed+geoip.csv](./csv_files/failed+geoip.csv)                             |
|Report 4                                  | [failed+invalid-ips.csv](./csv_files/failed+invalid-ips.csv)                 |

I also included the script I used to generate each csv file inside of [scripts/project1.sh](./script/project1.sh),
which does require the `auth.log` file inside of the same path as the script :)
