# Elastic-logrotate


Create elasticlogrotate certificate.

| Variable | Definition |
|-------------------|:--------------|
| INDEX_NAME    | Name of the index you want to rotate/delete         |
| MAX_AGE_ROLLOVER   | Rollover index with specified days old (example "1d")         |
| MAX_DOCS   | Rollover index with specified docs (example "5000")         |
| MAX_SIZE   | Rollover index with specified size (example "5gb")         |
| ELASTIC_HOST   | Elasticsearchstratio coordinator url (example "https://coordinator.elasticsearchstratio.l4lb.thisdcos.directory")         |
| ELASTIC_PORT   | Elasticsearchstratio coordinator url (example "9200")         |
| DAYS_COUNT_DELETE   | Delete index with the specified days old (example "7")         |
| ROLLOVERSCRIPT_TIME   | Specify how often the rollover script runs in seconds (example "3600")         |
| DELETESCRIPT_TIME   | Specify how often the delete script runs in seconds (example "86400")        |