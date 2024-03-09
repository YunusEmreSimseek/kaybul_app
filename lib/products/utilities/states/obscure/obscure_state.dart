part of 'obscure_cubit.dart';

final class ObscureState extends Equatable implements BaseState {
  const ObscureState({this.isObscure = true});
  final bool isObscure;

  ObscureState copyWith({bool? isObscure}) {
    return ObscureState(
      isObscure: isObscure ?? this.isObscure,
    );
  }

  @override
  List<Object> get props => [isObscure];
}
