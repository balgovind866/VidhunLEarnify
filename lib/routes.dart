





import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:student_deshboard/screens/home_page.dart';
import 'package:student_deshboard/screens/login_screen.dart';
import 'package:student_deshboard/screens/persantation/teacher/teacher_screan.dart';

import 'constant/routes_constants.dart';


class NamedRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteList.Home:
        return getPageRoute(const HomePage(uid: '',));
      case RouteList.LoginScrean:
        return getPageRoute(const LoginScrean());
      case RouteList.teacher:
        return getPageRoute(const TeacherScrean());
        default:
        return MaterialPageRoute(builder: (_) => const HomePage(uid: '',));
    }
  }
}
PageRouteBuilder getPageRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return screen;
    },
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child) {
      return Align(
        /// you can also change it
        child: SizeTransition(
          sizeFactor: animation,
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 500), /// you can change it
  );
}
