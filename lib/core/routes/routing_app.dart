import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/dashboard_screen.dart';

import '../../feature/authentication/UI/screen/forget_password/forget_password_screen.dart';
import '../../feature/authentication/UI/screen/login/login_screen.dart';
import '../common/widgets/layouts/templates/site_layout.dart';
import '../common/widgets/responsive/screens/desktop_layout.dart';
import '../common/widgets/responsive/screens/mobile_layout.dart';
import '../common/widgets/responsive/screens/tablet_layout.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: TRoutingHelper.loginInScreen,
  routes: [
    GoRoute(
      path: TRoutingHelper.loginInScreen,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: TRoutingHelper.forgetPasswordScreen,
      builder: (context, state) => const ForgetPasswordScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return TSiteTemplate(
          desktop: DesktopLayout(body: child),
          tablet: TabletLayout(body: child),
          mobile: MobileLayout(body: child),
        );
      },
      routes: [
        GoRoute(
          path: TRoutingHelper.dashboard,
          builder: (context, state) => const DashboardScreen(),
        ),
        GoRoute(
          path: TRoutingHelper.media,
          builder: (context, state) =>
              const Center(child: Text("Media Screen")),
        ),
        GoRoute(
          path: TRoutingHelper.banner,
          builder: (context, state) =>
              const Center(child: Text("Banner Screen")),
        ),
      ],
    ),
  ],
);
