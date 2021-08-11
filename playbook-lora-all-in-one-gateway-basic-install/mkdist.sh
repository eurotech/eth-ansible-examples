#!/bin/sh

set -e

DIST_RESOURCES_DIR=$(realpath ./dist_resources)
PLAYBOOK_DIR=$(realpath ./playbook)

OUT_DIR=$(realpath ./out)
mkdir -p ${OUT_DIR}

PACKAGE_DIR=$(realpath ./out/package)
mkdir -p ${PACKAGE_DIR}

SELF_EXTRACT_DIR=$(realpath ./out/selfextract)
mkdir -p ${SELF_EXTRACT_DIR}

PACKAGE_NAME=package.tar.gz
PACKAGE=${OUT_DIR}/${PACKAGE_NAME}

UPDATE_NAME=lora-all-in-one-gateway-base-install
UPDATE_VERSION=0.1.0
NAME=${UPDATE_NAME}-${UPDATE_VERSION}

PACKAGE_MD5=

compute_md5() {
  if which md5 > /dev/null
  then
    md5 -q $1
  elif which md5sum > /dev/null
  then
    md5sum $1 | awk '{print $1}'
  else
    exit 1
  fi
}

build_package() {
  cp -r ${PLAYBOOK_DIR}/* ${PACKAGE_DIR}
  cd ${PACKAGE_DIR} || exit
  GZIP=-9 tar -czvf ${PACKAGE} *
  PACKAGE_MD5=$(compute_md5 ${PACKAGE})
}

build_self_extracting() {
  cp "${DIST_RESOURCES_DIR}/self_extract.sh.in" "${SELF_EXTRACT_DIR}/self_extract.sh"
  sed -i -- "s/__MD5__/${PACKAGE_MD5}/g" "${SELF_EXTRACT_DIR}/self_extract.sh"
  sed -i -- "s/__UPDATE_NAME__/${UPDATE_NAME}/g" "${SELF_EXTRACT_DIR}/self_extract.sh"
  sed -i -- "s/__UPDATE_VERSION__/${UPDATE_VERSION}/g" "${SELF_EXTRACT_DIR}/self_extract.sh"
  cat ${PACKAGE} >> "${SELF_EXTRACT_DIR}/self_extract.sh"
}

dist_playbook_only() {
  build_package
  OUTFILE=$(realpath ${OUT_DIR}/${NAME}-playbook.tar.gz)
  mv ${PACKAGE} ${OUTFILE}
  echo "======= ${OUTFILE} ======="
  echo "Package Name : ${UPDATE_NAME}"
  echo "Package Version : ${UPDATE_VERSION}"
  echo "MD5 Hash value : $(compute_md5 ${OUTFILE})"
}

dist_deploy_v2() {
  build_package
  build_self_extracting
  OUTFILE=$(realpath ${OUT_DIR}/${NAME}-deploy-v2.sh)
  mv "${SELF_EXTRACT_DIR}/self_extract.sh" "${OUTFILE}"
  echo "======= ${OUTFILE} ======="
  echo "Package Name : ${UPDATE_NAME}"
  echo "Package Version : ${UPDATE_VERSION}"
  echo "MD5 Hash value : $(compute_md5 ${OUTFILE})"
}

case $1 in
  "--deploy-v2")
    dist_deploy_v2
  ;;
  "--playbook")
    dist_playbook_only
  ;;
  "--clean")
    rm -rf ${OUT_DIR}
  ;;
  *)
  echo "please specify --playbook or --deploy-v2"
  ;;
esac
