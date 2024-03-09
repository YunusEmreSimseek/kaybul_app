part of '../home_view.dart';

final class ProductLwb {
  static SizedBox _productLwb(
      BuildContext context,
      ProductState state,
      void Function(ProductModel)? editProductButtonOnPressed,
      void Function(String) productLocaitonButtonOnPressed,
      void Function(ProductModel) basicQuestionOnPressed) {
    return SizedBox(
      height: context.sized.dynamicHeight(.5),
      child: ListView.builder(
        itemCount: state.products?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          final currentIndex = state.products?[index];
          return _productContainer(context, currentIndex, editProductButtonOnPressed, productLocaitonButtonOnPressed,
              basicQuestionOnPressed);
        },
      ),
    );
  }

  static Padding _productContainer(
      BuildContext context,
      ProductViewModel? currentIndex,
      void Function(ProductModel)? editProductButtonOnPressed,
      void Function(String) productLocaitonButtonOnPressed,
      void Function(ProductModel) basicQuestionOnPressed) {
    return Padding(
      padding: context.padding.onlyBottomNormal,
      child: Row(
        children: [
          currentIndex?.image != null ? _hasImage(currentIndex, context) : _hasNoImage(context),
          context.sized.emptySizedWidthBoxNormal,
          SizedBox(
            width: context.sized.dynamicWidth(.51),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titleAndEditButtonRow(context, currentIndex, editProductButtonOnPressed),
                context.sized.emptySizedHeightBoxLow,
                _locationAndRemoveButtonRow(
                    context, currentIndex, productLocaitonButtonOnPressed, basicQuestionOnPressed)
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Image _hasNoImage(BuildContext context) {
    return Image.asset(
      Images.default_product.toPath(),
      fit: BoxFit.contain,
      height: context.sized.dynamicHeight(.1),
      width: context.sized.dynamicWidth(.3),
    );
  }

  static Image _hasImage(ProductViewModel? currentIndex, BuildContext context) {
    return Image.memory(
      currentIndex!.image!,
      fit: BoxFit.fill,
      height: context.sized.dynamicHeight(.135),
      width: context.sized.dynamicWidth(.35),
    );
  }

  static Align _titleText(ProductState state, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: TitleText(
          state.products != null ? StringConstant.homeAvailableFurnitures : StringConstant.homeNoFurnitures,
          context: context),
    );
  }

  static Row _titleAndEditButtonRow(
      BuildContext context, ProductViewModel? currentIndex, void Function(ProductModel)? editProductButtonOnPressed) {
    return Row(
      children: [
        context.sized.emptySizedWidthBoxLow3x,
        SizedBox(
          width: context.sized.dynamicWidth(.3),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TitleText(
              currentIndex?.title ?? '',
              context: context,
              maxLines: 2,
            ),
          ),
        ),
        const Spacer(),
        EditProductButton(
          onPressed: () => editProductButtonOnPressed?.call(
            currentIndex!.toProductModel(),
          ),
          context: context,
        ),
      ],
    );
  }

  static Row _locationAndRemoveButtonRow(BuildContext context, ProductViewModel? currentIndex,
      void Function(String) productLocaitonButtonOnPressed, void Function(ProductModel) basicQuestionOnPressed) {
    return Row(
      children: [
        SizedBox(
          width: context.sized.dynamicWidth(.2),
          child: Align(
            alignment: Alignment.centerLeft,
            child: ProductLocationButton(
              onPressed: () => productLocaitonButtonOnPressed.call(currentIndex?.api ?? ''),
              context: context,
            ),
          ),
        ),
        const Spacer(),
        DeleteProductButton(
          onPressed: () {
            BasicQuestionDialog.show(
              title: StringConstant.deleteProductTitle,
              context: context,
              onPressed: () => basicQuestionOnPressed.call(currentIndex!.toProductModel()),
            );
          },
          context: context,
        )
      ],
    );
  }

  static SizedBox _threePointDropDownButton(BuildContext context) {
    return SizedBox(
        width: context.sized.dynamicWidth(.07),
        child: ThreePointDropDownButton(
          context: context,
        ));
  }
}
