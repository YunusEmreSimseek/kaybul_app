import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/models/product_model.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/mixins/edit_product_dialog_mixin.dart';
import 'package:kaybul_app/products/widgets/buttons/general_button.dart';
import 'package:kaybul_app/products/widgets/dialogs/dialog_base.dart';
import 'package:kaybul_app/products/widgets/fields/add_product_field.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

final class EditProductDialog extends StatefulWidget {
  const EditProductDialog({super.key, required this.product});
  final ProductModel product;
  static Future<bool> show({
    required BuildContext context,
    required ProductModel product,
  }) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => EditProductDialog(
        product: product,
      ),
    );
    return true;
  }

  @override
  State<EditProductDialog> createState() => _EditProductDialogState();
}

class _EditProductDialogState extends State<EditProductDialog> with BaseViewMixin, EditProductDialogMixin {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: context.padding.verticalLow,
        child: TitleText(StringConstant.editProductTitle, context: context),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GeneralText(StringConstant.addProductName, context: context),
          context.sized.emptySizedWidthBoxLow3x,
          SizedBox(
              width: context.sized.dynamicWidth(.4),
              height: context.sized.dynamicHeight(.05),
              child: ProductField(controller: editNameController, context: context))
        ],
      ),
      actions: [
        GeneralButton(
            onPressed: () => updateProduct(name: editNameController.text, product: widget.product),
            title: StringConstant.addProductSave,
            context: context)
      ],
    );
  }
}
