import 'package:digital_secure_assignment/core/widgets/custom_btn.dart';
import 'package:digital_secure_assignment/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late Size size;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  _errorMessageWidget() {
    log("Size Equal= ${size.width * 0.7}");

    return Container(
      width: size.width * 0.7,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/ic_cancel.png", height: 30, width: 30),
          10.width,
          const Text("Credentials are incorrect", style: TextStyle(color: Colors.white, fontSize: 18),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topLeft,
                  image: AssetImage("assets/images/login_bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(bottom: size.height * 0.1),
              height: size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _errorMessageWidget(),
                        15.height,
                        CustomTextFormField(
                            textEditingController: usernameController,
                            hintText: "Username or Email"),
                        15.height,
                        CustomTextFormField(
                          hintText: "Password",
                          textEditingController: passwordController,
                        ),
                      ],
                    ),
                  ),
                  CustomBtn(text: "Register/Log in ", onPressed: () {}),
                ],
              ))),
    );
  }
}
