import 'package:flutter/material.dart';
import 'package:kaybul_app/products/enums/drop_down_states.dart';

final class ThreePointDropDownButton extends DropdownButton {
  ThreePointDropDownButton({super.key, required BuildContext context})
      : super(
          underline: const SizedBox.shrink(),
          isExpanded: true,
          icon: const Icon(Icons.more_horiz_rounded),
          items: [
            DropdownMenuItem(value: 0, child: Center(child: DropDownStates.add.icon)),
            DropdownMenuItem(value: 1, child: Center(child: DropDownStates.profile.icon)),
            DropdownMenuItem(value: 2, child: Center(child: DropDownStates.exit.icon)),
          ],
          onChanged: (value) async {
            switch (value) {
              case 0:
                await DropDownStates.add.navigate(
                  context: context,
                );
                break;
              case 1:
                await DropDownStates.profile.navigate(
                  context: context,
                );
                break;
              case 2:
                DropDownStates.exit.navigate(
                  context: context,
                );
                break;
            }
          },
        );
}
