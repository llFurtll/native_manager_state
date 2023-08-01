import 'package:example/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:native_state/widgets/native_app.dart';

void main() {
  runApp(
    NativeMaterialApp(
      debugShowCheckedModeBanner: false,
      nativeRoutes: AppPages.pages,
    )
  );
}