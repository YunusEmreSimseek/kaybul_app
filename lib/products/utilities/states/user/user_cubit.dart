import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaybul_app/products/models/user_model.dart';
import 'package:kaybul_app/products/services/user/user_service.dart';
import 'package:kaybul_app/products/utilities/states/base/base_state.dart';

part 'user_state.dart';

final class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState());

  final IUserService _userService = UserService();

  Future<UserModel?> fetchUser(String email) async {
    final user = await _userService.fetchSignedInUserDetails(email);
    return user;
  }

  Future<void> fetchSignedInUserDetails(String email) async {
    final user = await fetchUser(email);
    if (user == null) return;
    emit(state.copyWith(user: user));
  }
}
