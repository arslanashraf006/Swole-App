import 'package:flutter/material.dart';
import 'package:swole_app/constants/app_strings.dart';
import 'package:swole_app/routes/routes_name.dart';
import 'package:swole_app/ui/screens/create_account/create_account.dart';
import 'package:swole_app/ui/screens/current_user/current_user.dart';
import 'package:swole_app/ui/screens/login_screen/login_screen.dart';
import 'package:swole_app/ui/screens/reset_password/reset_password.dart';
import 'package:swole_app/ui/widgets/text_widget.dart';
import '../ui/screens/splash_screen/splash_screen.dart';
import '../ui/screens/welcome_screen/welcome_screen.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case RoutesName.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen(),);
      case RoutesName.signup:
        return MaterialPageRoute(builder: (context) => const CreateAccountScreen(),);
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen(),);
      case RoutesName.resetPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ResetPassword(),);
      case RoutesName.welcomeScreen:
        return MaterialPageRoute(builder: (context) => const WelcomeScreen(),);
      case RoutesName.currentUserScreen:
        return MaterialPageRoute(builder: (context) => CurrentUserScreen(),);
      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: TextWidget(title: AppStrings.noRouteText),
            ),
          );
        },
        );
    }
  }
}