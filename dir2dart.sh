###############################################
#
# Author: @eaglesakura
# Repository: https://github.com/eaglesakura/dartres
#
###############################################
#! /bin/bash -eu

export in_dir=$1
export dart_file="lib/res/`basename $in_dir`.dart"

echo "file=in_dir | $dart_file"

export CLASS_NAME="R_base64_`basename $in_dir`"

rm "$dart_file"
echo "///" >> "$dart_file"
echo "/// auto generated from ${in_dir}" >> "$dart_file"
echo "///" >> "$dart_file"
echo "class  $CLASS_NAME {" >> "$dart_file"
for file in `find ${in_dir} -type f`; do
    export _file_name=`basename "$file"`
    export key="`echo ${_file_name} | sed -e "s/\./_/g" | sed -e "s/-/_/g"`"
    echo "  static const __$key = '`cat ${file} | base64 | tr -d '\n'`';" >> "$dart_file"
    echo "  String get $key => __$key;" >> "$dart_file"
done
echo "}" >> "$dart_file"
dartfmt -w "$dart_file"
