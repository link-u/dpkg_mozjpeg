#! /bin/bash -eux

set -eux

## git リポジトリ上の root のパスを取得
scripts_dir=$(readlink -f $(cd $(dirname $(readlink -f $0)) && pwd))
root_dir=$(cd ${scripts_dir} && cd .. && pwd)
cd ${root_dir}

apt install -y ./artifact/*.deb
apt show mozjpeg
which cjpeg
which djpeg

cjpeg -version
djpeg -version

cjpeg -version | grep -i "mozjpeg"
djpeg -version | grep -i "mozjpeg"

ldd $(which cjpeg)
ldd $(which djpeg)
