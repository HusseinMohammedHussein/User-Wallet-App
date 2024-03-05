import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';

import '../custom_user_card.dart';

class UsersListSection extends StatefulWidget {
  const UsersListSection({super.key});

  @override
  State<UsersListSection> createState() => _UsersListSectionState();
}

class _UsersListSectionState extends State<UsersListSection> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: size.height * 0.3,
      child: ListView.separated(
          separatorBuilder: (c, i) {
            return 30.width;
          },
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          itemBuilder: (context, index) => const CustomUserCard()),
    );
  }
}
