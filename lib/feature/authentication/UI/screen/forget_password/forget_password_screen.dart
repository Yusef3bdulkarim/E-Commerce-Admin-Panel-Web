import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/forget_password/responsive_screens/forget_password_desktop_tablet.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/forget_password/responsive_screens/forget_password_mobile.dart';
import '../../../../../core/common/widgets/layouts/templates/site_layout.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TSiteTemplate(
        desktop: ForgetPasswordDesktopTablet(),
        tablet:ForgetPasswordDesktopTablet(),
        mobile: ForgetPasswordMobile(),
      ),
    );
  }
}
