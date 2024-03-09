import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/utilities/states/loading/loading_cubit.dart';
import 'package:kaybul_app/products/utilities/states/obscure/obscure_cubit.dart';
import 'package:kaybul_app/products/utilities/states/product/product_cubit.dart';
import 'package:kaybul_app/products/utilities/states/user/user_cubit.dart';

/// That is going to initialize the blocs for the application.
final class BlocInitialize extends MultiBlocProvider {
  BlocInitialize({super.key, required super.child})
      : super(providers: [
          BlocProvider<LoadingCubit>(create: (context) => LoadingCubit()),
          BlocProvider<ObscureCubit>(create: (context) => ObscureCubit()),
          BlocProvider<UserCubit>(create: (context) => UserCubit()),
          BlocProvider<ProductCubit>(create: (context) => ProductCubit()),
        ]);
}
