import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:native_manager_state/core/native_router.dart';

class NativeMaterialApp extends MaterialApp {
  final List<NativeRouter> nativeRoutes;

  NativeMaterialApp({
    required this.nativeRoutes,
    super.key,
    super.navigatorKey,
    super.scaffoldMessengerKey,
    super.home,
    super.initialRoute,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.navigatorObservers,
    super.builder,
    super.title = '',
    super.onGenerateTitle,
    super.color,
    super.theme,
    super.darkTheme,
    super.highContrastTheme,
    super.highContrastDarkTheme,
    super.themeMode,
    super.themeAnimationDuration,
    super.themeAnimationCurve,
    super.locale,
    super.localizationsDelegates,
    super.localeListResolutionCallback,
    super.localeResolutionCallback,
    super.supportedLocales,
    super.debugShowMaterialGrid,
    super.showPerformanceOverlay,
    super.checkerboardRasterCacheImages,
    super.checkerboardOffscreenLayers,
    super.showSemanticsDebugger,
    super.debugShowCheckedModeBanner,
    super.shortcuts,
    super.actions,
    super.restorationScopeId,
    super.scrollBehavior,
  }) : super(
    onGenerateRoute: (settings) {
      final router = nativeRoutes.firstWhere((route) => route.name == settings.name);
      router.inject(GetIt.I);
      return MaterialPageRoute(builder: (context) => router.build());
    }, 
  );
}