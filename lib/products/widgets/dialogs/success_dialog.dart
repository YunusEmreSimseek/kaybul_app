import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/widgets/dialogs/basic_title_dialog.dart';

final class SuccessDialog extends BasicTitleDialog {
  const SuccessDialog({super.key}) : super(title: StringConstant.successTitle);

  Future<void> show(BuildContext context) async {
    await BasicTitleDialog.show(title: title, context: context);
  }
}
