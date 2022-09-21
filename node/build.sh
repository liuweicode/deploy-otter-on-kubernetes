#!/bin/bash

set -eux

rm -rf node.deployer-4.2.18.tar.gz

tar czvf node.deployer-4.2.18.tar.gz node.deployer-4.2.18

docker build -t tl-otter:uat-otter-node-4.2.18 -f Dockerfile .

docker images | grep 'uat-otter-node-4.2.18'

IMAGETAG=$(docker images | grep 'uat-otter-node-4.2.18' | head -n 1 | awk '{print $3}')

echo $IMAGETAG

docker tag $IMAGETAG toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-otter:uat-otter-node-4.2.18

docker push toplist-registry.cn-shanghai.cr.aliyuncs.com/88/tl-otter:uat-otter-node-4.2.18
