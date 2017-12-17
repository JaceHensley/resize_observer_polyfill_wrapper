// MIT License

// Copyright (c) 2017 Jace Hensley

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:html';

import 'package:js/js.dart';

import 'package:resize_observer_polyfill_wrapper/src/js_interop.dart' as js_interop;
import 'package:resize_observer_polyfill_wrapper/src/resize_observer_entry.dart';

/// Error thrown when the required `resize_observer_polyfill.js` library has not been loaded.
class MissingResizeObserverPolyfillJsError extends Error {
  @override
  String toString() =>
      'Missing ResizeObserver Polyfill Library: resize_observer_polyfill.js must be loaded.';
}

class ResizeObserver {
  js_interop.ResizeObserver _jsObserver;

  ResizeObserverCallback _callback;

  ResizeObserver(this._callback) {
    try {
      _jsObserver = new js_interop.ResizeObserver(allowInterop(_interopCallback));
    } catch (e) {
      throw new MissingResizeObserverPolyfillJsError();
    }
  }

  // --------------------------------------------------------------------------
  // Private Utility Methods
  // --------------------------------------------------------------------------

  void _interopCallback(List<js_interop.ResizeObserverEntry> jsEntries, js_interop.ResizeObserver observer) {
    _callback(_generateEntries(jsEntries), this);
  }

  List<ResizeObserverEntry> _generateEntries(List<js_interop.ResizeObserverEntry> jsEntries) {
    return jsEntries.map((jsEntry) {
      var rectangle = new Rectangle(
          jsEntry.contentRect.left,
          jsEntry.contentRect.top,
          jsEntry.contentRect.width,
          jsEntry.contentRect.height
      );

      return new ResizeObserverEntry(
          target: jsEntry.target,
          rectangle: rectangle
      );
    });
  }

  // --------------------------------------------------------------------------
  // Public API Methods
  // --------------------------------------------------------------------------

  void observe(Element target) {
    _jsObserver.observe(target);
  }

  void unobserve(Element target) {
    _jsObserver.unobserve(target);
  }

  void disconnect() {
    _jsObserver.disconnect();
  }
}

typedef ResizeObserverCallback(List<ResizeObserverEntry> entries, ResizeObserver observer);
