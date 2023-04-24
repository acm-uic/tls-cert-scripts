#/bin/bash
openssl req -new -out acm.cs.uic.edu.csr -newkey rsa:4096 -nodes -sha256 -keyout acm.cs.uic.edu.key -config req.conf
