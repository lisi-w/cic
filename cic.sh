#!/bin/bash

cd /export/witham3/cic

bash /export/witham3/esgf/conda.sh
. ~/.bashrc

conda activate cic

thedate=`date +%y%m%d_%H%M`
destpath=/p/user_pub/publish-queue/inconsistencies/$thedate/
cmorpath=/usr/local/cmip6-cmor-tables/Tables/
mkdir -p $destpath



python3 cic.py $destpath $cmorpath
