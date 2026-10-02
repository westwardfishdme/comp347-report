---
title: Write-up Report for SSHD Logins for COMP347
author: Jonathan Villanueva
date: 10-02-2026
abstract: |
  Short Analysis of provided `auth.log` that tracked SSH logins
  to SSHd (the SSH server daemon). All related csv files can be found inside
  of ./csv_files/
---

# Report 1: Successful Authentications
The provided file: `accepted.csv` contains all of the IP addresses that were able to successfully
log into the SSH server, including their usernames, origin, and occurrences. Below is a short summary
of information about the file:

- A total of **50 users** were able to successfully log into the server.
- All logins were Password Based authentications
- The highest successful logins is sourced from **vuser2.**, who logged in a total of **266** 
  times from 266 unique addresses at several different dates.
    - While some of these IP's are under the same IP block (or in some cases under reserved IP blocks as
    designated by IANA Special-Purpose Address Registry), excessive logins from numerous different IPs
    flags this account as potentially being compromised. Especially since there are numerous IPs that 
    are logging in from external networks.
- While numerous other accounts had logins from varying IPs, there is not enough data to signify
whether the inbound traffic was malicious or not.

### Response to excessive logins from vuser2
It is recommended that the user of *vuser2* rotate their public and private keys on the server, and
that the server administrator disable password based logins in the file `/etc/ssh/sshd_config` with:

```bash
  PasswordAuthentication no
  PubkeyAuthentication yes
```

# Report 2: Failed Authentications
The provided files: \[`invalid.csv`, `failed.csv`\] include both  **SSH bruteforce attempts** to 
invalid users, and **failed login attempts to existing accounts** respectively.

## Short summary
Majority of these failed logins were from password based authentications, which indicates that
attackers were attempting to use bruteforcing methods to login to the account.

\pagebreak
# Report 3: Legitimate Users Failed Authentications
All legitimate users that failed authentication from `failed.csv` had the source IP and geo-location
reported into `failed+geoip.csv` 

Below is a list of users that failed to authenticate with the server:

- adelandaluce
- adhungana1
- aszymczak
- avilladeleon
- fsyed3
- jbajerek
- lford
- mbui3
- rrimocal
- rrusaiteme
- vuser2

\pagebreak
# Report 4: Attack Sources by IP
All data related to the Attack Sources + IPs can be found inside the file: `failed+invalid-ips.csv`.

## Short Summary:
There are **5242** IPs that attacked the server. 
Below is a table of the top 10 countries (*named by country code*) 
ranked by the amount of their attacks:

|rank|country code|occurrences|
|----|------------|-----------|
|1   |US          |  778      |
|2   |VN          |  451      |
|3   |IN          |  407      |
|4   |CN          |  335      |
|5   |ID          |  280      |
|6   |BR          |  268      |
|7   |TH          |  232      |
|8   |KR          |  181      |
|9   |DE          |  180      |
|10  |SG          |  144      |


## References
Below is a list of references used to determine the information used in this report:

- [OpenSSHD source code](https://github.com/openssh/openssh-portable/blob/87f0cd1892e501f835dd210abea5461807c8deba/audit.h#L32)
- [OpenSSHD documentation](https://man.openbsd.org/sshd_config)
