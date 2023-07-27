import 'package:example/inject/count_inject.dart';
import 'package:example/inject/second_inject.dart';
import 'package:example/view/count_view.dart';
import 'package:example/view/second_view.dart';
import 'package:flutter/material.dart';
import 'package:native_state/core/native_router.dart';
import 'package:native_state/widgets/native_app.dart';

void main() {
  runApp(
    NativeMaterialApp(
      nativeRoutes: [
        NativeRouter(
          name: "/",
          build: () => const CountView(),
          inject: CountInject()
        ),
        NativeRouter(
          name: "/second",
          build: () => const SecondView(),
          inject: SecondInject()
        )
      ],
      initialRoute: "/"
    )
  );
}