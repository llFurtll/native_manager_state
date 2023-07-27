import 'package:flutter/material.dart';
import 'package:native_manager_state/core/native_router.dart';
import 'package:native_manager_state/pages/details/inject/detail_inject.dart';
import 'package:native_manager_state/pages/details/view/detail_view.dart';
import 'package:native_manager_state/pages/home/inject/home_native_inject.dart';
import 'package:native_manager_state/pages/home/view/home_view.dart';
import 'package:native_manager_state/widgets/native_app.dart';

void main() {
  runApp(
    NativeMaterialApp(
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
      nativeRoutes: [
        NativeRouter(
          name: "/",
          build: () => const HomeView(),
          inject: HomeNativeInject()
        ),
        NativeRouter(
          name: "/detail",
          build: () => const DetailView(),
          inject: DetailInject()
        )
      ]
    )
  );
}