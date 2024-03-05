import 'package:digital_secure_assignment/core/functions/custom_toast.dart';
import 'package:digital_secure_assignment/core/functions/date_service.dart';
import 'package:digital_secure_assignment/core/functions/email_regexp.dart';
import 'package:digital_secure_assignment/core/functions/navigation.dart';
import 'package:digital_secure_assignment/core/widgets/custom_btn.dart';
import 'package:digital_secure_assignment/core/widgets/custom_text_form_field.dart';
import 'package:digital_secure_assignment/features/auth/presentation/cubit/auth_state.dart';
import 'package:digital_secure_assignment/features/auth/presentation/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../cubit/auth_cubit.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late Size size;
  TextEditingController usernameOrEmailCont = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String walletBalance = '',
      transactionAmount = '',
      walletUpdateDate = '',
      transactionDate = '';

  _initDataValues() {
    double initValue = 1000;
    DateTime date = DateTime.now();

    walletBalance = initValue.toString();
    transactionAmount = (initValue - 200).toString();
    walletUpdateDate = parseDate(date);
    transactionDate = parseDate(date.add(15.days));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is AuthFailureState) {
        showToast(state.errMessage);
      } else if (state is AuthSuccessState) {
        customReplacementNavigate(context, "/home");
      }
    }, builder: (context, state) {
      var authCubit = BlocProvider.of<AuthCubit>(context);
      return Scaffold(
        body: SafeArea(
            child: Form(
                key: authCubit.formKey,
                child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage(Assets.imagesLoginBg),
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
                              if (state is AuthFailureState)
                                const CustomErrorWidget(),
                              15.height,
                              CustomTextFormField(
                                  textEditingController: usernameOrEmailCont,
                                  hintText: AppStrings.usernameOrEmail),
                              15.height,
                              CustomTextFormField(
                                hintText: AppStrings.password,
                                textEditingController: passwordController,
                              ),
                            ],
                          ),
                        ),
                        CustomBtn(
                            text: AppStrings.registerLogin,
                            onPressed: () async {
                              if (authCubit.formKey.currentState!.validate()) {
                                var isEmail =
                                    checkIsInputEmail(usernameOrEmailCont.text);
                                log("is_input_email: $isEmail");
                                if (isEmail) {
                                  authCubit.email = usernameOrEmailCont.text;
                                } else {
                                  authCubit.username = usernameOrEmailCont.text;
                                }
                                authCubit.password = passwordController.text;

                                _initDataValues();

                                authCubit.walletBalance = walletBalance;
                                authCubit.walletUpdateDate = walletUpdateDate;
                                authCubit.transactionAmount = transactionAmount;
                                authCubit.transactionDate = transactionDate;
                                await authCubit.createNewUser();
                              }
                            }),
                      ],
                    )))),
      );
    });
  }
}
