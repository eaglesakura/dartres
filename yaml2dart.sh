###############################################
#
# Author: @eaglesakura
# Repository: https://github.com/eaglesakura/dartres
#
###############################################
#! /bin/bash -eu

# convert yaml2dart
export in_file=$1
export out_file="`dirname $in_file`/`basename $in_file .yaml`.json"
export dart_file="lib/res/`basename $in_file .yaml`.dart"

echo "file=$in_file -> $out_file | $dart_file"
xpipeline yaml2json --input "${in_file}" --output "${out_file}" > /dev/null

export CLASS_NAME="R_map_`basename $in_file .yaml`"
rm "$dart_file"
echo "///" >> "$dart_file"
echo "/// auto generated from ${in_file}" >> "$dart_file"
echo "///" >> "$dart_file"
echo "class  $CLASS_NAME {" >> "$dart_file"
echo "  Map<String, dynamic> _values;" >> "$dart_file"
echo "  $CLASS_NAME(this._values);" >> "$dart_file"
for key in `cat "$out_file" | jq -r '. | keys | .[]'`; do
    echo "  dynamic get $key => _values['$key'];" >> "$dart_file"
done
echo "}" >> "$dart_file"

dartfmt -w "$dart_file"
