# ResizeObserver Polyfill Wrapper

> A Dart wrapper around the [ResizeObserver Polyfill][resize-observer-polyfill]. Uses the [`js` Dart package][js-dart-package] to interop with the JS lib.

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
[resize-observer-polyfill]: https://github.com/Workiva/sockjs_client_wrapper
