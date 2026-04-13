import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:yt_ecommerce_admin_panel/core/utils/constants/enums.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/data/model/auth_model.dart';
import 'package:yt_ecommerce_admin_panel/feature/authentication/logic/auth_cubit.dart';

import '../../../../../../core/utils/constants/image_strings.dart';
import '../../../../../../core/utils/constants/sizes.dart';
import '../../../../../../core/utils/constants/text_strings.dart';
import '../../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../../core/utils/popups/loaders.dart';
import '../../../../../../core/utils/validators/validation.dart';

class TForgetPasswordForm extends StatefulWidget {
  const TForgetPasswordForm({
    super.key,
  });

  @override
  State<TForgetPasswordForm> createState() => _TForgetPasswordFormState();
}

class _TForgetPasswordFormState extends State<TForgetPasswordForm> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStates.loading) {
          TFullScreenLoader.openLoadingDialog(
            context,
            "We are processing your information",
            TImages.docerAnimation,
          );
        }

        if (state.status == AuthStates.failure ||
            state.status == AuthStates.loaded) {
          TFullScreenLoader.stopLoading(context);
        }

        if (state.status == AuthStates.failure) {
          TLoaders.errorSnackBar(
            context: context,
            title: "Oh Snap !!",
            message: state.messageError,
          );
        }
      },
      child: Form(
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
                      prefixIcon: Icon(Iconsax.direct_right),
                      labelText: TTexts.email,
                      hintText: TTexts.email),
                ),
                const Gap(TSizes.spaceBtwSections),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async{
                        // if (_loginFormKey.currentState!.validate()) {
                        //   context.read<AuthCubit>().resetPassword(
                        //       email: _emailController.text.trim());
                        // }
                        try {
                          await context.read<AuthCubit>().createNewAdmin(
                              newAdmin: AuthModel(
                                  userName: "Ali123",
                                  email: "ali@media.com", // جرب إيميل جديد خالص
                                  role: AppRole.admin,
                                  firstName: "Ali",
                                  lastName: "Hamada"),
                              password: "password123");
                          print("Done Successfully!");
                        } catch (e) {
                          print("The Error is: $e"); // ده هيقولك العطل فين بالظبط
                        }
                      },
                      child: Text(TTexts.signIn)),
                ),
              ],
            ),
          )),
    );
  }
}
