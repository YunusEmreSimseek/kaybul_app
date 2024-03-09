import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

// final class ProductLocationButton extends ElevatedButton {
//   ProductLocationButton({super.key, required super.onPressed, required BuildContext context})
//       : super(
//             child: Padding(
//           padding: context.padding.verticalLow,
//           child: GeneralText(StringConstant.homeShowLocation, context: context),
//         ));
// }

final class ProductLocationButton extends IconButton {
  ProductLocationButton({super.key, required super.onPressed, required BuildContext context})
      : super(
            icon: Card(
                child: Padding(
          padding: context.padding.low,
          child: const Icon(Icons.location_pin),
        )));
}
