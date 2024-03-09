import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/login/view/login_view.dart';
import 'package:kaybul_app/features/profile/view/profile_view.dart';
import 'package:kaybul_app/products/widgets/dialogs/add_product_dialog.dart';

enum DropDownStates {
  add(Icon(Icons.add_circle)),
  profile(Icon(Icons.person)),
  exit(Icon(Icons.exit_to_app)),
  ;

  const DropDownStates(this.icon);
  final Icon icon;
}

extension DropDownStatesExtension on DropDownStates {
  Future<void> navigate({
    required BuildContext context,
  }) async {
    switch (this) {
      case DropDownStates.add:
        await AddProductDialog.show(
          context: context,
        );
        break;
      case DropDownStates.profile:
        context.route.navigateToPage(const ProfileView());
        break;
      case DropDownStates.exit:
        await FirebaseAuth.instance.signOut();
        // ignore: use_build_context_synchronously
        context.route.navigateToPage(const LoginView());
        break;
    }
  }
}
