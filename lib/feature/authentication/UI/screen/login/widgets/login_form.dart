import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/routes/routing_helper.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/popups/full_screen_loader.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/popups/loaders.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/logic/auth_cubit.dart';

import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/text_strings.dart';
import '../../../../../../core/utils/validators/validation.dart';

class TLoginForm extends StatefulWidget {
  const TLoginForm({
    super.key,
  });

  @override
  State<TLoginForm> createState() => _TLoginFormState();
}

class _TLoginFormState extends State<TLoginForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status == AuthStates.loading) {
          TFullScreenLoader.openLoadingDialog(
            context,
            "We are processing your information",
            TImages.docerAnimation,
          );
        }

        if (state.status == AuthStates.failure || state.status == AuthStates.loaded) {
          TFullScreenLoader.stopLoading(context);
        }

        if (state.status == AuthStates.failure) {
          TLoaders.errorSnackBar(
            context: context,
            title: "Oh Snap !!",
            message: state.messageError,
          );

        }

        if (state.status == AuthStates.loaded) {
          context.go(TRoutingHelper.dashboard);
        }
      },
      builder: (context, state) {
        return Form(
          key: _loginFormKey,
            child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.user),
                  labelText: TTexts.email,
                  hintText: TTexts.email,
                ),
              ),
              const Gap(TSizes.spaceBtwInputFields / 2),
              TextFormField(
                controller: _passwordController,
                validator: (value) =>
                    TValidator.validateEmptyText("Password", value),
                obscureText: !state.isShowPassword,
                decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TTexts.password,
                  suffixIcon: IconButton(
                    onPressed: () =>
                        context.read<AuthCubit>().toggleShowPassword(),
                    icon: Icon(
                        state.isShowPassword ? Iconsax.eye : Iconsax.eye_slash),
                  ),
                ),
              ),
              const Gap(TSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: true, onChanged: (val) {}),
                      const Text(TTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                      onPressed: () =>
                          context.go(TRoutingHelper.forgetPasswordScreen),
                      child: const Text(TTexts.forgetPassword))
                ],
              ),
              const Gap(TSizes.spaceBtwSections),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_loginFormKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                              email: _emailController.text.trim(),
                              pass: _passwordController.text.trim(),
                            );
                      }
                    },
                    child: Text(TTexts.signIn)),
              ),
            ],
          ),
        ));
      },
    );
  }
}
