import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:interview/app/route_name.dart';
import 'package:interview/dashboard/view/dashboard.dart';
import 'package:interview/dashboard/view/mobile/all_Functions_Screen.dart';
import 'package:interview/dashboard/view/mobile/profile_screen.dart';
import 'package:interview/dashboard/view/mobile/setting.dart';
import 'package:interview/dashboard/view/mobile/userverfication.dart';
import 'package:interview/dashboard/view/mobile/verfication.dart';
import 'package:interview/dashboard/view/widgets/otpverfication.dart';

class Routes {
  GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: RouteNames.home,
        path: '/home',
        builder: (BuildContext context, GoRouterState state) {
          return Dashboard();
        },
      ),
      GoRoute(
        name: RouteNames.allFunctionsScreen,
        path: '/allFunctionsScreen',
        builder: (BuildContext context, GoRouterState state) {
          return AllFunctionsScreen();
        },
      ),
      GoRoute(
        name: RouteNames.profileScreen,
        path: '/profileScreen',
        builder: (BuildContext context, GoRouterState state) {
          return ProfileScreen();
        },
      ),
      GoRoute(
        name: RouteNames.setting,
        path: '/setting',
        builder: (BuildContext context, GoRouterState state) {
          return SettingsScreen();
        },
      ),
      GoRoute(
        name: RouteNames.verfication,
        path: '/verfication',
        builder: (BuildContext context, GoRouterState state) {
          return UserVerificationScreen();
        },
      ),

      GoRoute(
        name: RouteNames.otp,
        path: '/otp',
        builder: (BuildContext context, GoRouterState state) {
          return Otpverfication();
        },
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      return state.matchedLocation;
    },
    debugLogDiagnostics: true,
  );
}
