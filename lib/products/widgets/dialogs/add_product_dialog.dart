import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/utilities/mixins/add_product_dialog_mixin.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/states/loading/loading_cubit.dart';
import 'package:kaybul_app/products/widgets/buttons/add_product_button.dart';
import 'package:kaybul_app/products/widgets/buttons/general_button.dart';
import 'package:kaybul_app/products/widgets/dialogs/dialog_base.dart';
import 'package:kaybul_app/products/widgets/fields/add_product_field.dart';
import 'package:kaybul_app/products/widgets/texts/general_text.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

final class AddProductDialog extends StatefulWidget {
  const AddProductDialog({
    super.key,
  });

  static Future<bool> show({
    required BuildContext context,
  }) async {
    await DialogBase.show<bool>(
      context: context,
      builder: (context) => const AddProductDialog(),
    );
    return true;
  }

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> with BaseViewMixin, AddProductDialogMixin {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Padding(
        padding: context.padding.verticalLow,
        child: TitleText(StringConstant.addProductTitle, context: context),
      ),
      content: SizedBox(
        height: context.sized.dynamicHeight(.275),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GeneralText(StringConstant.addProductName, context: context),
                context.sized.emptySizedWidthBoxLow3x,
                SizedBox(
                    width: context.sized.dynamicWidth(.4),
                    height: context.sized.dynamicHeight(.05),
                    child: ProductField(controller: nameController, context: context))
              ],
            ),
            context.sized.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GeneralText(StringConstant.addProductApi, context: context),
                context.sized.emptySizedWidthBoxLow3x,
                SizedBox(
                    width: context.sized.dynamicWidth(.4),
                    height: context.sized.dynamicHeight(.05),
                    child: ProductField(controller: apiController, context: context))
              ],
            ),
            context.sized.emptySizedHeightBoxLow,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GeneralText(StringConstant.addProductImage, context: context),
                context.sized.emptySizedWidthBoxLow3x,
                SizedBox(
                    width: context.sized.dynamicWidth(.4),
                    child: ImagePickerButton(
                      onPressed: () async => await pickImage(apiController.text),
                    )),
              ],
            ),
            context.sized.emptySizedHeightBoxLow3x,
            GeneralText(StringConstant.addProductSubtitle, context: context),
            context.sized.emptySizedHeightBoxLow,
          ],
        ),
      ),
      actions: [
        BlocSelector<LoadingCubit, LoadingState, bool>(
          selector: (state) {
            return state.isLoading;
          },
          builder: (context, state) {
            return GeneralButton(
                onPressed: state ? null : () async => await addProduct(),
                title: StringConstant.addProductSave,
                context: context);
          },
        )
      ],
    );
  }
}
