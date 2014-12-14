# hashpipe

[![Build Status](https://secure.travis-ci.org/bantuXorg/hashpipe.png?branch=master)](http://travis-ci.org/bantuXorg/hashpipe)


## hashpipe256.sh Usage Example

#### Generation

    somesqldumper | gzip | ./hashpipe256.sh /path/to/outfile.sql.gz

#### Verification

    sha256sum --check /path/to/outfile.sql.gz.sha256
