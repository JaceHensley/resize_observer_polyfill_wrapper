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

@JS()
library resize_observer_polyfill_wrapper.src.js_interop;

import 'dart:html';

import 'package:js/js.dart';


@JS()
class ResizeObserver {
  external ResizeObserver(ResizeObserverCallback callback);

  external void observe(Element target);
  external void unobserve(Element target);
  external void disconnect();
}

@JS()
@anonymous
class ResizeObserverEntry {
    external Element get target;
    external DOMRectReadOnly get contentRect;
}

@JS()
@anonymous
class DOMRectReadOnly {
  external num get x;
  external num get y;
  external num get width;
  external num get height;
  external num get top;
  external num get right;
  external num get bottom;
  external num get left;
}

typedef void ResizeObserverCallback(List<ResizeObserverEntry> entries, ResizeObserver observer);
