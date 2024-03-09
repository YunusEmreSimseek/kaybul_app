import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/login/mixin/login_mixin.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/enums/text_field_type.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/padding/project_padding.dart';
import 'package:kaybul_app/products/widgets/buttons/general_button.dart';
import 'package:kaybul_app/products/widgets/fields/login_form_field.dart';
import 'package:kaybul_app/products/widgets/loadings/loading_without_child.dart.dart';
import 'package:kaybul_app/products/widgets/texts/app_bar_title_text.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

final class LoginView extends StatefulWidget {
  const LoginView({super.key});
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with BaseViewMixin, LoginMixin {
  @override
  Widget build(BuildContext context) {
    scrollToBottomOnKeyboardOpen();
    return Scaffold(
      appBar: AppBar(
        actions: const [LoadingWithoutChild()],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: ProjectPadding.allNormalDynamic(context),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search_outlined, size: 100, color: context.general.colorScheme.primary),
                context.sized.emptySizedHeightBoxNormal,
                AppBarTitleText(StringConstant.appName, context: context),
                context.sized.emptySizedHeightBoxLow,
                TitleText(StringConstant.loginTitle, context: context),
                context.sized.emptySizedHeightBoxNormal,
                LoginFormField(controller: emailController, type: TextFieldType.email),
                context.sized.emptySizedHeightBoxLow,
                LoginFormField(controller: passwordController, type: TextFieldType.password),
                context.sized.emptySizedHeightBoxNormal,
                Container(
                    margin: context.padding.onlyLeftHigh + context.padding.onlyLeftHigh,
                    child: GeneralText(StringConstant.loginDontHaveAnAccount, context: context)),
                context.sized.emptySizedHeightBoxLow,
                Row(
                  children: [
                    Expanded(
                        child: GeneralButton(
                            onPressed: () => login(), context: context, title: StringConstant.loginLogin)),
                    Expanded(
                        child: GeneralButton(
                            onPressed: () => navigateToRegisterView(),
                            context: context,
                            title: StringConstant.loginRegister))
                  ],
                ),
                context.sized.emptySizedHeightBoxHigh,
                context.sized.emptySizedHeightBoxNormal,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
