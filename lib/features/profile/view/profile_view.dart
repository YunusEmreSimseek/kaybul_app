import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/utilities/padding/project_padding.dart';
import 'package:kaybul_app/products/utilities/states/user/user_cubit.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

final class ProfileView extends StatefulWidget {
  const ProfileView({super.key});
  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.allNormalDynamic(context),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Center(
              child: Column(
                children: [
                  TitleText(state.user?.name ?? '', context: context),
                  TitleText(state.user?.email ?? '', context: context),
                  TitleText(state.user?.password ?? '', context: context),
                  TitleText(state.user?.phoneNo ?? '', context: context),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
