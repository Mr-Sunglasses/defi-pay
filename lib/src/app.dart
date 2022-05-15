import 'package:flutter/material.dart';

import 'presentation/views/auth/auth_view.dart';
import 'presentation/views/onboarding/onboarding_view.dart';
import 'presentation/views/splash/splash_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Providing a restorationScopeId allows the Navigator built by the
      // MaterialApp to restore the navigation stack when a user leaves and
      // returns to the app after it has been killed while running in the
      // background.
      restorationScopeId: 'app',

      // Define a light and dark color theme. Then, read the user's
      // preferred ThemeMode (light, dark, or system default) from the
      // SettingsController to display the correct theme.
      theme: ThemeData(),

      initialRoute: OnBoardingView.routeName,

      debugShowCheckedModeBanner: false,

      // Define a function to handle named routes in order to support
      // Flutter web url navigation and deep linking.
      onGenerateRoute: (RouteSettings routeSettings) {
        switch (routeSettings.name) {
          case SplashView.routeName:
            return MaterialPageRoute(builder: (_) => const SplashView());
          case OnBoardingView.routeName:
            return MaterialPageRoute(builder: (_) => const OnBoardingView());
          case AuthView.routeName:
            return MaterialPageRoute(builder: (_) => const AuthView());
        }
      },
    );
  }
}
