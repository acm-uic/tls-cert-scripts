Generate KEY and CSRs Suite
===========================

Author: Chase Lee <clee231@uic.edu>



What is this?
-------------
This repo is a collection of tools used to generate SSL certificates.
This will allow you to generate cert assets en-masse.

* generate.sh
  This short bash program will create new key and certificate signing requests.
  This requires 3 arguments.
  1. Server Name
  2. Fully Qualified Domain Name (FQDN)
  3. Contact Email

  Other configuration settings are currently available by editing the top 
  portion of the generate.sh file.

* dlCerts.sh
  This will automatically download the certificates from the server, given the
  id.  (Use this after the certificate has been issued.)


State of Affairs
----------------

August 02, 2017 - The User Services Development Team was informed that 
                  certificates MUST be issued by Comodo, rather than having 
                  Let's Encrypt automatically do this for us. :-( 
                  At least we already have these scripts written. 

February 9, 2017 - Qualys will drop VM1 & 2 grade from C to F this month. 
                   See ticket (#278)[https://misc.cso.uic.edu/redmine/issues/278].
                   VMs don't actually support the newer standards...
                   Probably will forever be capped at C. Need new VMs... and 
                   for package managers to actually work!

January 1, 2017 - Browsers (Chrome leading) is dropping SHA-1 trust. 
                  Certificates will not be trusted.  Switching to Let's Encrypt
                  as needed. Provides nice tool to automatically renew certs!

October 5, 2015 - Generation scripts written. Manual SSL generation process
                  documented on the Wiki.

