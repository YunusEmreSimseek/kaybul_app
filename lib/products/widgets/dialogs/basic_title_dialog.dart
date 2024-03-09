import 'package:flutter/material.dart';
import 'package:kaybul_app/products/widgets/dialogs/dialog_base.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

class BasicTitleDialog extends StatelessWidget {
  const BasicTitleDialog({super.key, required this.title});
  final String title;
  static Future<bool> show({required String title, required BuildContext context}) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => BasicTitleDialog(title: title),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: TitleText(title, context: context),
    );
  }
}
