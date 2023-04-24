#/bin/bash

#
# Note: acm.cs.uic.edu has a special configuration file to use. See the acm/ directory for details.
#

#
# Note2: This file should generally not be used anymore as we have consolidated all domains into a multi-domain certificate. This file is just kept here for reference.
#

openssl req -new -newkey rsa:4096 -nodes -out ./brink/brink_cs_uic_edu.csr -keyout ./brink/brink_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=brink.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./hans/hans_cs_uic_edu.csr -keyout ./hans/hans_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=hans.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./macserve/macserve_cs_uic_edu.csr -keyout ./macserve/macserve_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=macserve.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./malware/malware_cs_uic_edu.csr -keyout ./malware/malware_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=malware.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./app/app_acm_cs_uic_edu.csr -keyout ./app/app_acm_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=app.acm.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./ackem/ackem_acm_cs_uic_edu.csr -keyout ./ackem/ackem_acm_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=ackem.acm.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./lanparty/lanparty_acm_cs_uic_edu.csr -keyout ./lanparty/lanparty_acm_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=lanparty.acm.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./git/git_acm_cs_uic_edu.csr -keyout ./git/git_acm_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=git.acm.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./chat/chat_acm_cs_uic_edu.csr -keyout ./chat/chat_acm_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=chat.acm.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./teapot/teapot_cs_uic_edu.csr -keyout ./teapot/teapot_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=teapot.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256
openssl req -new -newkey rsa:4096 -nodes -out ./aurum/aurum_cs_uic_edu.csr -keyout ./aurum/aurum_cs_uic.edu.key -subj "/C=US/ST=Illinois/L=Chicago/O=University of Illinois at Chicago/OU=Computer Science/CN=aurum.cs.uic.edu/emailAddress=sigsysadmin@acm.cs.uic.edu" -sha256

#openssl req -in brink_cs_uic_edu.csr -noout -text
