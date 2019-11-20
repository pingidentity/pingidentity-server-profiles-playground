# List Index Status
dbtest list-index-status --backendID userRoot --baseDN o=student

# Rebuild Index Commands
rebuild-index --task --baseDN o=student --index acmeProfile.json.preferredRole \
    -D cn=administrator -w 2FederateM0re
# See Size of Indexes
dbtest list-all --analyze

ldapmodify <<EOMODIFY
dn: uid=user.99,ou=people,o=student
changetype: modify
add: objectclass
objectclass: acmePerson
-
add: acmeProfile
acmeProfile: 
  {  "roleIDs": [ 56, 28, 10, 22 ],  
     "preferredRole": 28,  
     "certificate": "ccccccjegfchbbjkjrulnfrbufnehknklrgeblijkrbu",  
     "costCenter": { "id": "11234-21", "name": "Sales", "active": true } 
  }
EOMODIFY

# Query Using JSON Filter
ldapsearch -b "o=student" '(acmeProfile:jsonObjectFilterExtensibleMatch:={ "filterType":"equals", "field":"preferredRole", "value":28 })'

