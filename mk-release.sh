#!/bin/sh

##############################################################################
# This is a simple script for making the build archives for the Basic
# Compression Library. The script has been tested under Linux / bash.
#
# Two archives are built (different formats, but with the same contents):
# name.zip and name.tar.bz2, where 'name' is the first argument to the script.
# For example:
#
#   mk-release.sh bcl-1.1.2
#
# will create
#
#   bcl-1.1.2.zip
#   bcl-1.1.2.tar.bz2
#
##############################################################################

# Check arguments
if [ "x$1" == "x" ]; then
  echo "Usage: $0 buildname"
  echo " buildname is the prefix of the archive, e.g. bcl-1.1.2"
  exit
fi

# Remember working dir
OLD_WD=`pwd`

# Make a temporary working directory
TMP_DIR=/tmp/bcl-release-$$
mkdir "$TMP_DIR"
cd "$TMP_DIR"

# Copy source directory content to working dir
mkdir $1
cp -R $OLD_WD/* ./$1/

# Build documentation
echo "Building documentation..."
cd $1/doc
rm -f manual.toc manual.pdf
make -s
cd ../..

# File list
FILE_LIST="$1/readme.html $1/style.css $1/src/*.c $1/src/*.h $1/src/Makefile $1/doc/manual.pdf"

# Build tar archive
echo "Building tar.bz2 archive..."
tar -cf $1.tar $FILE_LIST
bzip2 -9 $1.tar

# Build ZIP archive
echo "Building tar.gz archive..."
zip -9q $1.zip $FILE_LIST

# Copy resulting archives to OLD_WD
cp -f $1.tar.bz2 $1.zip "$OLD_WD"

# Go back to old working dir
cd "$OLD_WD"

# Remove temporary build directory
rm -rf "$TMP_DIR"

echo "Done!"
