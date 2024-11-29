#! /bin/sh -e
SCRATCH=scratch/$(basename "$0" .sh)
STRIP=${STRIP:-strip}

rm -rf "${SCRATCH}"
mkdir -p "${SCRATCH}"

cp simple "${SCRATCH}/"

${STRIP} --remove-section=.hash "${SCRATCH}/simple"

# Check if patchelf handles binaries without .hash section
../src/patchelf --set-interpreter /oops "${SCRATCH}/simple"
