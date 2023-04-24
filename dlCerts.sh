#/bin/bash

# Script written to download all the certs automatically and rename to the appropriate names.
# Author: Chase Lee (clee231)
# Usage: dlCerts.sh [folder_name] [SSL_ID]

TYPES=(x509CO x509IO x509IOR base64 bin x509)

args=("$@")
for i in ${args[@]}; do
	echo "Argument: ${i}"
done

if [ -n ${args[0]} ]
then
	folder=${args[0]}
	mkdir $folder
else
	read -p "What folder do we want to put the certificates in?: " folder
	mkdir $folder
fi

if [ -n $args[1] ]
then
	re='^[0-9]+$'
	if ! [[ ${args[1]} =~ $re ]]
	then
		echo "Error: SSL ID is not a number.: ${args[1]}"
		exit 1
	else
		id=${args[1]}
	fi
else
	read -p "What is the SSL ID assigned by InCommon?: " id
fi


#OUTPUT=$(cat test.txt)
for i in ${TYPES[@]}; do
OUTPUT=$(curl -i --request GET "https://cert-manager.com/customer/InCommon/ssl?action=download&sslId=$id&format=${i}")

SAVE_AS=$(echo "$OUTPUT" | awk '/filename=/{print $3}' | cut -c10- | tr -d '"')
SAVE_AS=${SAVE_AS%$'\r'}
SAVE_AS=${SAVE_AS%$'\n'}
SAVE_AS=${SAVE_AS%$'\r\n'}

IFS='.' read -ra SAVE_AS_MOD <<< "$SAVE_AS"
echo "Filename is: ${SAVE_AS_MOD[0]}.${i}.${SAVE_AS_MOD[1]}"

$(echo "$OUTPUT" | awk '/(\r|\r\n|\n)/{y=1;next}y' >> $folder/${SAVE_AS_MOD[0]}.${i}.${SAVE_AS_MOD[1]})
done
exit 0
