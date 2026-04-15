import 'package:go_router/go_router.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/all_banner/all_banner_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/create_banner/create_banner_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/banner_screen/UI/screen/edit_banner/edit_banner_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/all_brands/all_brand_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/create_brand/create_brand_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/brand_screen/UI/screen/edit_brands/edit_brand_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/category_screen/UI/screen/category_screen/category_screen.dart';
import 'package:yt_ecommerce_admin_panel/feature/dashboard%20screen/UI/screen/dashboard_screen.dart';

import '../../feature/authentication/UI/screen/forget_password/forget_password_screen.dart';
import '../../feature/authentication/UI/screen/login/login_screen.dart';
import '../../feature/category_screen/UI/screen/create_category/create_category.dart';
import '../../feature/category_screen/UI/screen/edit_category/edit_category.dart';
import '../../feature/media_screen/UI/screen/media_screen.dart';
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
          builder: (context, state) => const MediaScreen(),
        ),
        /////////
        GoRoute(
          path: TRoutingHelper.categoryScreen,
          builder: (context, state) => const CategoryScreen(),
        ),

        GoRoute(
          path: TRoutingHelper.createScreen.trim(),
          builder: (context, state) =>
              const CreateCategoryScreen(), // تأكد من اسم الصفحة عندك
        ),
        GoRoute(
          path: TRoutingHelper.editScreen.trim(),
          builder: (context, state) => const EditCategoryScreen(),
        ),
        //////////
        GoRoute(
          path: TRoutingHelper.brandScreen,
          builder: (context, state) => const AllBrandScreen(),
        ),

        GoRoute(
          path: TRoutingHelper.createBrandScreen.trim(),
          builder: (context, state) => const CreateBrandScreen(),
        ),
        GoRoute(
          path: TRoutingHelper.editBrandScreen.trim(),
          builder: (context, state) => const EditBrandScreen(),
        ),

        ///////////////
        GoRoute(
          path: TRoutingHelper.bannerScreen.trim(),
          builder: (context, state) => const AllBannerScreen(),
        ),

        GoRoute(
          path: TRoutingHelper.createBannerScreen.trim(),
          builder: (context, state) => const CreateBannerScreen(),
        ),
        GoRoute(
          path: TRoutingHelper.editBannerScreen.trim(),
          builder: (context, state) => const EditBannerScreen(),
        ),
      ],
    ),
  ],
);
