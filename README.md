# Elastic-logrotate


You need to create elasticlogrotate certificate in vault with name "elasticlogrotate".You also need to add permissions over elasticsearch to "elasticlogrotate" user. After that, deploy elastic-rollover.json in DC/OS.

| Variable | Definition |
|-------------------|:--------------|
| INDEX_NAME    | Name of the index you want to rotate/delete (example "default")         |
| MAX_AGE_ROLLOVER   | Rollover index with specified days old (example "1d")         |
| MAX_DOCS   | Rollover index with specified docs (example "5000")         |
| MAX_SIZE   | Rollover index with specified size (example "5gb")         |
| ELASTIC_HOST   | Elasticsearchstratio coordinator url (example "https://coordinator.elasticsearchstratio.l4lb.thisdcos.directory")         |
| ELASTIC_PORT   | Elasticsearchstratio coordinator url (example "9200")         |
| DAYS_COUNT_DELETE   | Delete index with the specified days old (example "7")         |
| ROLLOVERSCRIPT_TIME   | Specify how often the rollover script runs in seconds (example "3600")         |
| DELETESCRIPT_TIME   | Specify how often the delete script runs in seconds (example "86400")        |
