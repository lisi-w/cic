#!/bin/bash

srcdir=`dirname $0`
cd $srcdir
ENV=$1
bash ./conda.sh
. ~/.bashrc

conda activate $ENV

thedate=`date +%y%m%d_%H%M`
destpath=/p/user_pub/publish-queue/inconsistencies/$thedate
cmorpath=/usr/local/cmip6-cmor-tables/Tables/
mkdir -p $destpath



# nohup python3 cic.py --output-dir $destpath --cmor-tables $cmorpath --email e.witham@columbia.edu ames4@llnl.gov --fix-errors --enable-email > $destpath/cic.$thedate.log
nohup python3 cic.py --output-dir $destpath/ --cmor-tables $cmorpath --email ames4@llnl.gov --fix-errors --enable-ac > $destpath/cic.$thedate.log
cp $destpath/metrics.* ./metrics/
mkdir $destpath/graphs
python3 time_series.py $destpath/graphs
