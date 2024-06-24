import 'package:dyslexia_app/feature/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/login_screen.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/new_password_screen.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/on_boarding_screen.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/reset_password_screen.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/send_code_screen.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/sign_up_screen.dart';
import 'package:dyslexia_app/feature/auth/presentation/screens/splash_screen.dart';
import 'package:dyslexia_app/feature/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String intitlRoute = '/';

  static const String home = '/home';
  static const String login = '/login';
  static const String signUp = '/signUp';
  static const String sendCode = '/sendCode';
  static const String resetPassword = '/resetPassword';
  static const String newPassword = '/newPassword';
  static const String onBoarding = '/onBoarding';

}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.intitlRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.sendCode:
        return MaterialPageRoute(builder: (_) => const SendCodeScreen());
      case Routes.newPassword:
        return MaterialPageRoute(builder: (_) => const NewPasswordScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
