import 'package:flutter/material.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/forget_password/widgets/forget_password_form.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/forget_password/widgets/forget_password_header.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/login/widgets/login_form.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/UI/screen/login/widgets/login_header.dart';

import '../../../../../../core/utils/constants/sizes.dart';

class ForgetPasswordMobile extends StatelessWidget {
  const ForgetPasswordMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [TForgetPasswordHeader(), TForgetPasswordForm()],
        ),
      ),
    );
  }
}
