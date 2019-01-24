# dartres
dart2.x resource utils.

# install

Copy ".sh" files into your project.

And install "xpipeline" tool.

```
go get github.com/eaglesakura/xpipeline
```

# How to use.

## yaml2dart.sh

```
# sample.yaml
foo: "foo_value"
```

```bash
# run script
yaml2dart.sh sample.yaml
```

```dart
// generated
// lib/res/sample.dart
class R_sample {
  Map<String, dynamic> _values;
  R_sample(this._values);
  dynamic get foo => _values['foo'];
}
```

## dir2dart.sh

```bash
# run script
yaml2dart.sh example/sample_dir
```

```dart
// generated
// lib/res/sample_dir.dart
class R_base64_sample_dir {
  static const foo_file_name_txt =
      '...base64 encoded file...';
}
```

# LICENSE

MIT LICENSE.

```
The MIT License (MIT)

Copyright (c) 2019 @eaglesakura

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
