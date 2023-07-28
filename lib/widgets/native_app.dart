import 'package:flutter/material.dart';
import 'package:native_state/core/native_observer_route.dart';
import 'package:native_state/core/native_router.dart';

/// NativeMaterialApp é basicamente o MaterialApp, a diferença
/// que ele irá trabalhar com NativeRouter, que são a abstração
/// das rotas de navegação e também ele implementa o onGenerateRoute,
/// que no caso ele fica responsável em buscar o NativeRouter correspondente
/// a rota que está sendo acessada, injetar as dependências em memória, no caso
/// ele vai chamar o método dependencies do NativeInject, e nisso exibir o Widget,
/// que foi configurado no método build do NativeRouter. Por padrão deve-se ser
/// passado também o initialRoute.
/// Um ponto importante que por padrão o Flutter sempre procura um Widget configurado
/// com a rota "/".
class NativeMaterialApp extends MaterialApp {
  final List<NativeRouter> nativeRoutes;

  NativeMaterialApp({
    required this.nativeRoutes,
    super.key,
    super.scaffoldMessengerKey,
    super.home,
    super.onGenerateInitialRoutes,
    super.onUnknownRoute,
    super.builder,
    super.title,
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
      router.inject.dependencies();
      return MaterialPageRoute(builder: (context) => router.build(), settings: settings);
    },
    navigatorObservers: [NativeObserverRoute()],
  );
}