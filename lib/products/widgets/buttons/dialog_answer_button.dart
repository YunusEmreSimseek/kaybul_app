import 'package:flutter/material.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';

final class DialogAnswerButton extends ElevatedButton {
  DialogAnswerButton({super.key, required super.onPressed, required BuildContext context, required String text})
      : super(child: GeneralText(text, context: context));
}
