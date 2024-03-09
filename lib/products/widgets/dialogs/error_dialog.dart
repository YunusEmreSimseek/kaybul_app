import 'package:flutter/material.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/widgets/dialogs/basic_title_dialog.dart';

final class ErrorDialog extends BasicTitleDialog {
  const ErrorDialog({super.key}) : super(title: StringConstant.errorTitle);

  Future<void> show(BuildContext context) async {
    await BasicTitleDialog.show(title: title, context: context);
  }
}
