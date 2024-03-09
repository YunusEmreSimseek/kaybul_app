import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:kaybul_app/features/home/mixin/home_mixin.dart';
import 'package:kaybul_app/products/constants/string_constant.dart';
import 'package:kaybul_app/products/enums/images.dart';
import 'package:kaybul_app/products/models/product_model.dart';
import 'package:kaybul_app/products/utilities/mixins/base_view_mixin.dart';
import 'package:kaybul_app/products/utilities/padding/project_padding.dart';
import 'package:kaybul_app/products/utilities/states/product/product_cubit.dart';
import 'package:kaybul_app/products/view_models/product_view_model.dart';
import 'package:kaybul_app/products/widgets/buttons/delete_product_button.dart';
import 'package:kaybul_app/products/widgets/buttons/drop_down_button.dart';
import 'package:kaybul_app/products/widgets/buttons/edit_prodcut_button.dart';
import 'package:kaybul_app/products/widgets/buttons/product_location_button.dart';
import 'package:kaybul_app/products/widgets/dialogs/basic_question_dialog.dart';
import 'package:kaybul_app/products/widgets/loadings/loading_with_chield.dart';
import 'package:kaybul_app/products/widgets/texts/app_bar_title_text.dart';
import 'package:kaybul_app/products/widgets/texts/title_text.dart';

part 'sub_view/product_lwb.dart';

final class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseViewMixin, HomeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [LoadingWithChild(child: ProductLwb._threePointDropDownButton(context))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: ProjectPadding.allNormalDynamic(context),
          child: BlocBuilder<ProductCubit, ProductState>(
            builder: (context, state) {
              return Center(
                child: Column(
                  children: [
                    AppBarTitleText(StringConstant.appName, context: context),
                    context.sized.emptySizedHeightBoxLow,
                    TitleText(StringConstant.loginTitle, context: context),
                    context.sized.emptySizedHeightBoxNormal,
                    ProductLwb._titleText(state, context),
                    context.sized.emptySizedHeightBoxLow3x,
                    ProductLwb._productLwb(context, state, editProduct, getLocation, deleteProduct),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
