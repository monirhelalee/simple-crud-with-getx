import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/common_widgets/common_button.dart';
import '../../../core/common_widgets/common_text_field.dart';
import '../../../core/resource/colors.dart';
import '../../../core/utils/validator.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var spaceBetween = const SizedBox(
      height: 10,
    );
    var welcomeTextWidget = Text(
      "Welcome",
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppTheme.darkBlueColor),
    );
    var signInToContinueTextWidget = Text(
      "Sign in to continue",
      style: GoogleFonts.poppins(
          fontWeight: FontWeight.normal,
          fontSize: 14,
          color: AppTheme.greyColor),
    );
    var emailWidget = CommonTextField(
      prefixIcon: const Icon(Icons.person_2_outlined),
      controller: controller.emailController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(controller.passwordFocus);
      },
      hintText: "User Name",
    );
    var passwordWidget = CommonTextField(
      focusNode: controller.passwordFocus,
      controller: controller.passwordController,
      validator: Validator().nullFieldValidate,
      prefixIcon: const Icon(Icons.lock_outline),
      hintText: "Password",
      obSecure: true,
      onFieldSubmitted: (v) async {
        FocusManager.instance.primaryFocus!.unfocus();
        if (controller.formKey.currentState!.validate()) {
          await controller.onLogin();
        }
      },
    );
    var signInButton = Obx(() => controller.isLoading.value
        ? const Center(child: CircularProgressIndicator())
        : CommonButton(
            buttonTitle: "SIGN IN",
            onTap: () async {
              if (controller.formKey.currentState!.validate()) {
                await controller.onLogin();
              }
            },
          ));
    var logoWidget = Icon(
      Icons.shopping_bag_outlined,
      color: AppTheme.primaryColor,
      size: 150,
    );
    debugPrint("height $width");
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: width <= 420 ? width * .35 : 100,
                ),
                logoWidget,
                spaceBetween,
                spaceBetween,
                welcomeTextWidget,
                spaceBetween,
                signInToContinueTextWidget,
                spaceBetween,
                spaceBetween,
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      emailWidget,
                      spaceBetween,
                      spaceBetween,
                      passwordWidget,
                      spaceBetween,
                      spaceBetween,
                      spaceBetween,
                      signInButton,
                      spaceBetween,
                      spaceBetween,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
