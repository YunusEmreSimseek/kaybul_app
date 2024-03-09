import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/widgets/buttons/dialog_answer_button.dart';
import 'package:kaybul_app/products/widgets/dialogs/dialog_base.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

class BasicQuestionDialog extends StatelessWidget {
  const BasicQuestionDialog({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;
  static Future<bool> show(
      {required String title, required void Function() onPressed, required BuildContext context}) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => BasicQuestionDialog(title: title, onPressed: onPressed),
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      title: TitleText(title, context: context),
      actions: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DialogAnswerButton(onPressed: onPressed, context: context, text: 'Evet'),
              context.sized.emptySizedWidthBoxNormal,
              DialogAnswerButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  context: context,
                  text: 'Hayır'),
            ],
          ),
        )
      ],
    );
  }
}
