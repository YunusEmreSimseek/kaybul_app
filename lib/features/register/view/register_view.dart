import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/register/mixin/register_mixin.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/enums/text_field_type.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/padding/project_padding.dart';
import 'package:kaybul_app/products/widgets/buttons/general_button.dart';
import 'package:kaybul_app/products/widgets/fields/register_form_field.dart';
import 'package:kaybul_app/products/widgets/loadings/loading_without_child.dart.dart';
import 'package:kaybul_app/products/widgets/texts/app_bar_title_text.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

final class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with BaseViewMixin, RegisterMixin {
  @override
  Widget build(BuildContext context) {
    scrollToBottomOnKeyboardOpen();
    return Scaffold(
      appBar: AppBar(
        actions: const [LoadingWithoutChild()],
      ),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Form(
          key: formKey,
          child: Padding(
            padding: ProjectPadding.allNormalDynamic(context),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.search_outlined, size: 100, color: context.general.colorScheme.primary),
                  context.sized.emptySizedHeightBoxNormal,
                  AppBarTitleText(StringConstant.appName, context: context),
                  context.sized.emptySizedHeightBoxLow,
                  TitleText(StringConstant.registerTitle, context: context),
                  context.sized.emptySizedHeightBoxNormal,
                  RegisterFormField(controller: nameController, type: TextFieldType.name),
                  context.sized.emptySizedHeightBoxLow,
                  RegisterFormField(controller: emailController, type: TextFieldType.email),
                  context.sized.emptySizedHeightBoxLow,
                  RegisterFormField(controller: passwordController, type: TextFieldType.password),
                  context.sized.emptySizedHeightBoxLow,
                  RegisterFormField(controller: passwordConfirmController, type: TextFieldType.confirmPassword),
                  context.sized.emptySizedHeightBoxNormal,
                  Container(
                      margin: context.padding.onlyLeftHigh + context.padding.onlyLeftHigh,
                      child: GeneralText(StringConstant.registerAlreadyHaveAnAccount, context: context)),
                  context.sized.emptySizedHeightBoxLow,
                  Row(
                    children: [
                      Expanded(
                          child: GeneralButton(
                              onPressed: () async => await register(),
                              context: context,
                              title: StringConstant.registerRegister)),
                      Expanded(
                          child: GeneralButton(
                              onPressed: () => navigateToLoginView(),
                              context: context,
                              title: StringConstant.registerLogin))
                    ],
                  ),
                  context.sized.emptySizedHeightBoxHigh,
                  context.sized.emptySizedHeightBoxNormal,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
