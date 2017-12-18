# ResizeObserver Polyfill Wrapper

> A Dart wrapper around the [ResizeObserver Polyfill][resize-observer-polyfill]. Uses the [`js` Dart package][js-dart-package] to interop with the JS lib.

[![Pub](https://img.shields.io/pub/v/resize_observer_polyfill_wrapper.svg)](https://pub.dartlang.org/packages/resize_observer_polyfill_wrapper)
[![Build Status](https://travis-ci.org/JaceHensley/resize_observer_polyfill_wrapper.svg?branch=master)](https://travis-ci.org/JaceHensley/resize_observer_polyfill_wrapper)
![dart](https://img.shields.io/badge/%3C%2F%3E-Dart-blue.svg)
[![license](https://img.shields.io/github/license/mashape/apistatus.svg?maxAge=2592000)](https://github.com/JaceHensley/resize_observer_polyfill_wrapper/blob/master/LICENSE)

## Usage

- main.dart
```dart
import 'dart:html';

import 'package:resize_observer_polyfill_wrapper/resize_observer_polyfill_wrapper.dart';

main() {
  var ob = new ResizeObserver((entries, ob) {
    for (var entry in entries) {
      window.console.log(entry);
    }
  });

  ob.observe(querySelector('#textarea'));
}
```

- index.html
```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta charset="utf-8">
    <title>Virtual Tree</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">

    <script defer src="main.dart" type="application/dart"></script>
    <script defer src="packages/browser/dart.js"></script>

    <!-- javascript -->
    <script src="packages/resize_observer_polyfill_wrapper/resize_observer_polyfill.js"></script>
</head>
<body>
  <textarea id="textarea"></textarea>
</body>
</html>
```


[js-dart-package]: https://pub.dartlang.org/packages/js
[resize-observer-polyfill]: https://github.com/que-etc/resize-observer-polyfill
