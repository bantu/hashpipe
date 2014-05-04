# hashpipe

[![Build Status](https://secure.travis-ci.org/bantu/hashpipe.png?branch=master)](http://travis-ci.org/bantu/hashpipe)


## hashpipe256.sh Usage Example

#### Generation

    somesqldumper | gzip | ./hashpipe256.sh /path/to/outfile.sql.gz

#### Verification

    sha256sum --check /path/to/outfile.sql.gz.sha256
