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


* acm/generate.sh
  This is a customized script to generate the key and certificate signing
  requests for the multi-domain certificate that ACM utilizes.

State of Affairs
----------------

April 24, 2023 - Scripts and repo brought over for public use. Some updates 
                 have been made to accommodate use in the ACM@UIC.

August 02, 2017 - The Development Team was informed that certificates MUST 
                  be issued by Comodo, rather than having Let's Encrypt
                  automatically do this for us. :-( 
                  At least we already have these scripts written. 

February 9, 2017 - Qualys will drop SHA1 certifcate grades from C to F this month. 

January 1, 2017 - Browsers (Chrome leading) is dropping SHA-1 trust. 
                  Certificates will not be trusted.  Switching to Let's Encrypt
                  as needed. Provides nice tool to automatically renew certs!

October 5, 2015 - Generation scripts written.

