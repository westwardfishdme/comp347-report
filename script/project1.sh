#!/usr/bin/env bash
function get_count(){
  for i in $login; do
    echo "$i, $($1|grep $i| wc -l)"
  done
}
# regex functions

function accepted(){
  grep "Accepted" ./auth.log | grep -v "PubkeyAccepted" | awk '{ printf("%s, %s\n", $9, $11) }'
}

function invalid(){
  # ones that DO NOT exist
  grep "Invalid" ./auth.log  | awk '{ printf("%s, %s\n", $10, $8) }'
  # catch the null ones
  grep "Failed" ./auth.log | grep "user  from"  | awk '{ printf("%s, NULL\n", $12) }'
}

function failed(){
  # ones that do exist
  grep "Failed" ./auth.log | grep -v "invalid user"  | awk '{ printf("%s, %s\n", $11, $9) }'
}

# main
function main(){
  # set internal field separator
  SAVEIFS=$IFS
  IFS=$'\n'
  echo $2
  login=$($1 |sort|uniq)
  logins=($login)

  # get the accepted logins.
  case $1 in 
    accepted)
      echo "getting valid logins" >&2
      sleep 1
      get_count $1 
    ;;
    invalid)
      # get the rejected logins.
      echo "getting invalid logins" >&2
      echo "this one might take some time..." >&2
      sleep 1
      get_count $1
    ;;
    failed)
      # get the rejected logins.
      echo "getting failed logins" >&2
      sleep 1
      get_count $1
    ;;
  esac
  IFS=$SAVEIFS
  exit 0
}

main $@
