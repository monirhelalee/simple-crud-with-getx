import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/common_widgets/common_button.dart';
import '../../../core/common_widgets/common_text_field.dart';
import '../../../core/resource/colors.dart';
import '../../../core/utils/validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var passwordFocus = FocusNode();
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
      controller: _emailController,
      validator: Validator().nullFieldValidate,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(passwordFocus);
      },
      hintText: "User Name",
    );
    var passwordWidget = CommonTextField(
      focusNode: passwordFocus,
      controller: _passwordController,
      validator: Validator().nullFieldValidate,
      prefixIcon: const Icon(Icons.lock_outline),
      hintText: "Password",
      onFieldSubmitted: (v) async {
        FocusManager.instance.primaryFocus!.unfocus();
        if (_formKey.currentState!.validate()) {
          // await authVm.signIn();
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => const BottomNavBar()),
          //     (Route<dynamic> route) => false);
        }
      },
    );
    var signInButton = CommonButton(
      buttonTitle: "SIGN IN",
      onTap: () async {
        if (_formKey.currentState!.validate()) {
          // await authVm.signIn();
          // Navigator.of(context).pushAndRemoveUntil(
          //     MaterialPageRoute(
          //         builder: (BuildContext context) => const BottomNavBar()),
          //     (Route<dynamic> route) => false);
        }
      },
    );
    var logoWidget = Icon(
      Icons.shopping_bag_outlined,
      color: AppTheme.primaryColor,
      size: 150,
    );
    debugPrint("height $width");
    return Scaffold(
      body: Form(
        key: _formKey,
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
