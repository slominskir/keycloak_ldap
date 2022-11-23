#!/bin/bash

dsconf localhost backend create --suffix="dc=example,dc=com" --be-name="example"

ldapadd -D "cn=Directory Manager" -w password -H ldap://ldap:3389 -x <<EOF
dn: dc=example,dc=com
dc: example
objectClass: dcObject
objectClass: organizationalUnit
ou: example
EOF

ldapadd -D "cn=Directory Manager" -w password -H ldap://ldap:3389 -x <<EOF
dn: ou=People,dc=example,dc=com
objectClass: top
objectClass: organizationalUnit
ou: People
EOF


ldapadd -D "cn=Directory Manager" -w password -H ldap://ldap:3389 -x <<EOF
dn: uid=jdoe,ou=People,dc=example,dc=com
uid: jdoe
givenName: John
objectClass: top
objectClass: person
objectClass: organizationalPerson
objectClass: inetorgperson
sn: Doe
cn: John Doe
EOF