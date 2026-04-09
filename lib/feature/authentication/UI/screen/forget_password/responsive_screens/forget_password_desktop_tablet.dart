import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/core/common/widgets/layouts/templates/login_template.dart';

import '../widgets/forget_password_form.dart';
import '../widgets/forget_password_header.dart';

class ForgetPasswordDesktopTablet extends StatelessWidget {
  const ForgetPasswordDesktopTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return TLoginTemplate(
      child: Column(
        children: [TForgetPasswordHeader(), TForgetPasswordForm()],
      ),
    );
  }
}
