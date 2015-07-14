#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo '================================================================================='
    echo 'Script usage: ./uploadimage.sh disk-format image-version file-location image-name'
    echo '---------------------------------------------------------------------------------'
    echo 'diskformats  : raw, qcow2, vhd, iso'
    echo 'image-version: The version for the new image' 
    echo 'file-location: The location of the image you want to upload'
    echo 'image-name   : The name you want it to have on OpenStack'
    echo '================================================================================='
    exit 1
fi

diskformat="$1"
imageversion="$2"
imagelocation="$3"
imagename="$4"

openstack image create --container-format bare --disk-format "$diskformat" --property os_version="$imageversion" --file "$imagelocation" "$imagename"
