import 'package:digital_secure_assignment/core/utils/app_assets.dart';
import 'package:digital_secure_assignment/core/utils/app_colors.dart';
import 'package:digital_secure_assignment/core/utils/app_strings.dart';
import 'package:digital_secure_assignment/core/widgets/custom_btn.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_cubit.dart';
import 'package:digital_secure_assignment/features/home/presentation/cubit/home_state.dart';
import 'package:digital_secure_assignment/features/home/presentation/widgets/home_sections/balance_cards_section.dart';
import 'package:digital_secure_assignment/features/home/presentation/widgets/home_sections/header_section.dart';
import 'package:digital_secure_assignment/features/home/presentation/widgets/home_sections/users_list_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../core/utils/app_text_styles.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.offWhite,
            body: state is HomeLoadingState
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.05),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topCenter,
                        image: AssetImage(Assets.imagesHomeBg),
                        fit: BoxFit.contain,
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const HeaderSection(),
                              20.height,
                              const BalanceCards(),
                              30.height,
                              CustomBtn(
                                text: "Test",
                                onPressed: (){},
                              ),
                              30.height,
                              Text(
                                AppStrings.users,
                                style: CustomTextStyles.style25Bold
                                    .copyWith(color: Colors.black),
                              ),
                              15.height,
                              const UsersListSection()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
