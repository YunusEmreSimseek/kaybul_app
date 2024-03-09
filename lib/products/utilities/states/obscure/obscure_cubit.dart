import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/utilities/states/base/base_state.dart';

part 'obscure_state.dart';

final class ObscureCubit extends Cubit<ObscureState> {
  ObscureCubit() : super(const ObscureState());

  void changeObscure() {
    emit(state.copyWith(isObscure: !state.isObscure));
  }
}
