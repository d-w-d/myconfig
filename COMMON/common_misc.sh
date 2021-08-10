#!/usr/bin/env false

### Odd versions of node are not LTS and not suitable for production
### So use the latest even version number as default
nvm alias default 14 2> /dev/null 1>&2
