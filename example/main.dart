import 'dart:html';

import 'package:resize_observer_polyfill_wrapper/resize_observer_polyfill_wrapper.dart';

main() {
  var ob = new ResizeObserver((entries, ob) {
    entries.forEach(window.console.log);
  });

  ob.observe(querySelector('#textarea'));
}
