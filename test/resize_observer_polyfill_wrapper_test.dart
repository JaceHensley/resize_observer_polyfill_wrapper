// MIT License
//
// Copyright (c) 2017 Jace Hensley
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

@TestOn('browser')
library resize_observer_polyfill_wrapper.test.resize_observer_polyfill_wrapper;

import 'dart:async';
import 'dart:html';

import 'package:resize_observer_polyfill_wrapper/resize_observer_polyfill_wrapper.dart';
import 'package:test/test.dart';

void main() {
  group('ResizeObserver', () {
    ResizeObserver ob;
    List<ResizeObserverEntry> observedEntries;
    DivElement target;


    setUp(() {
      target = new DivElement();
      document.body.append(target);
      ob = new ResizeObserver((entries, __) {
        print('here');
        observedEntries = entries;
      });
    });

    tearDown(() {
      ob.disconnect();
      ob = null;
      target.remove();
      target = null;
    });

    test('observe', () async {
      ob.observe(target);
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries.single.target, target);
      expect(observedEntries.single.rectangle.height, 0);

      observedEntries.clear();

      target.style.height = '10px';
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries.single.target, target);
      expect(observedEntries.single.rectangle.height, 10);
    });

    test('unobserve', () async {
      ob.observe(target);
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries.single.target, target);
      expect(observedEntries.single.rectangle.height, 0);

      observedEntries.clear();

      target.style.height = '10px';
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries.single.target, target);
      expect(observedEntries.single.rectangle.height, 10);

      ob.unobserve(target);

      observedEntries.clear();

      target.style.height = '10px';
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries, isEmpty);
    });

    test('disconnect', () async {
      ob.observe(target);
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries.single.target, target);
      expect(observedEntries.single.rectangle.height, 0);

      observedEntries.clear();

      target.style.height = '10px';
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries.single.target, target);
      expect(observedEntries.single.rectangle.height, 10);

      ob.disconnect();

      observedEntries.clear();

      target.style.height = '10px';
      await new Future.delayed(const Duration(seconds: 1));

      expect(observedEntries, isEmpty);
    });
  });
}
