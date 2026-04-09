import 'package:flutter/material.dart';

import '../../../../../../core/utils/constants/sizes.dart';
import '../widgets/login_form.dart';
import '../widgets/login_header.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TLoginHeader(),
            TLoginForm(),
          ],
        ),
      ),
    );
  }
}
