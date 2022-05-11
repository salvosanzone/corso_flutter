import 'package:social_app/pages/check_loggated.dart';
import 'package:social_app/pages/home.dart';
import 'package:social_app/pages/login_page.dart';


generateRoutes() {
  return {
    '/': (context) => const CheckLoggated(),
    '/home': (context) => const Home(),
    '/login': (context) => const LoginPage(),
  };
}