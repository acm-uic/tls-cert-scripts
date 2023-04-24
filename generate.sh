#/bin/bash
# Author: Chase Lee <clee231@uic.edu>
# Description: Generates new keys and certificate signing requests(CSRs) for a given servername.
# Version: 1.0.4
# Requirements: 
#    - OpenSSL 0.9.8e-fips-rhel5 or newer
#    - Bash 3.2.25 or newer 
#    - Grep 2.5.1 or newer


###### i18n lines for easy replacement ######

PROG_VER="1.0.3"
PROG_STR="Key and CSR generator by Chase Lee - Version "$PROG_VER
HELP_STR="usage: "$0" serverName FQDN contactEmail\n\nEXAMPLE: $0 cso cso.uic.edu sigsysadmin@acm.cs.uic.edu\n\n$# arguments found."
GEN_STR="Generating Server Key and CSR..."
GEN_FOLDER="Creating Folder..."

###### Configuration Lines ######

SUBJ_C="US"
SUBJ_ST="Illinois"
SUBJ_L="Chicago"
SUBJ_O="University of Illinois at Chicago"
SUBJ_OU="Computer Science"
SUBJ_STR="/C=$SUBJ_C/ST=$SUBJ_ST/L=$SUBJ_L/O=$SUBJ_O/OU=$SUBJ_OU/CN=$2/emailAddress=$3"

###### DO NOT MODIFY BELOW THIS LINE! ######

# Validate the user input against regular expressions.
# TODO: Note that this does not account for the new TLDs that ICANN is now allowing. POST 2014. Fix this if we ever need unicode domain support.
function validate_input () {
 
  if [[ "$1" =~ [^a-zA-Z0-9.-+] ]]
  then
    echo "INVALID server name. Must be only alphanumeric."
    ERROR=true
  fi

  # This grep call is required because bash doesn't support positive lookaheads.
  fqdn=`echo $2 | grep -P '(?=^.{1,254}$)(^(?>(?!\d+\.)[a-zA-Z0-9_\-]{1,63}\.?)+(?:[a-zA-Z]{2,})$)'`
  if [ -z "$fqdn" ]
  then
    echo "INVALID Fully Qualified Domain Name(FQDN)."
    ERROR=true
  fi
  shopt -s nocasematch
  if ! [[ "$3" =~ ^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$ ]]
  then
    echo "INVALID contact email address: $3"
    ERROR=true
  fi

  if [ $ERROR ]
  then
    echo "Please correct the incorrect input before continuing."
    exit -1
  fi

}

# Check for the existence of a folder. Create the folder if it doesn't exist.
function mkfolder () {
  if [ ! -d ./$1 ]
  then
    echo $GEN_FOLDER
    mkdir -p ./$1
  fi
}

if [ $# != 3 ]
then
  echo -e $HELP_STR
else
  validate_input $1 $2 $3

  FILENAME=${2//./_}
  KEY_FILEPATH="./$1/$FILENAME.key"
  CSR_FILEPATH="./$1/$FILENAME.csr"
  mkfolder $1

  echo $GEN_STR
  echo -e "Subject String: $SUBJ_STR"
  echo -e "CSR Location: $CSR_FILEPATH"
  echo -e "Key Location: $KEY_FILEPATH"

  # `-sha256` is required as of Early 2016, due to SHA-1 collision bug
  openssl req -new -newkey rsa:4096 -nodes -out $CSR_FILEPATH -keyout $KEY_FILEPATH -subj "$SUBJ_STR" -sha256
fi


# Use this string to check against openssl.
#openssl req -in cso_uic_edu.csr -noout -text
