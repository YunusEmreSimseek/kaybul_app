part of 'user_cubit.dart';

final class UserState extends Equatable implements BaseState {
  const UserState({this.user});

  final UserModel? user;

  UserState copyWith({UserModel? user}) {
    return UserState(
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        user,
      ];
}
