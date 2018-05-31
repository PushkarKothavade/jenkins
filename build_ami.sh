#!/bin/bash

packer build -var 'var_source_ami='$1'' -var 'var_ami_name='$2'' foo.json
