// Copyright (c) 2021, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flavor_test/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(
    () => runApp(
      const ProviderScope(
        child: App(),
      ),
    ),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}
