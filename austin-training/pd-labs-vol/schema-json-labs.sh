# List Index Status
./dbtest list-index-status --backendID userRoot --baseDN o=student

# Rebuild Index Commands
./rebuild-index --task --baseDN o=student --index acmeProfile.json.preferredRole \
    -D cn=administrator -w 2FederateM0re
# See Size of Indexes
./dbtest list-all --analyze

# Query Using JSON Filter
./ldapsearch -b "o=student" '(acmeProfile:jsonObjectFilterExtensibleMatch:={ "filterType":"equals", "field":"preferredRole", "value":28 })'

