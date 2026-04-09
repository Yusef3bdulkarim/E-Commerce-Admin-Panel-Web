import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/site_layout.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/login/responsive_screens/login_desktop_tablet.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/login/responsive_screens/login_mobile.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TSiteTemplate(
        desktop: LoginDesktopTablet(),
        tablet: LoginDesktopTablet(),
        mobile: LoginMobile(),
      ),
    );
  }
}
