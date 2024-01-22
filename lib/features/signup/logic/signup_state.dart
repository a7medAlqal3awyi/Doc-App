import 'package:freezed_annotation/freezed_annotation.dart';

part 'signup_state.freezed.dart';

@Freezed()
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.signupInitial() = _Initial;

  const factory SignupState.signupLoading() = Loading;

  const factory SignupState.signupSuccess(T data) = Success<T>;

  const factory SignupState.signupError({required String error}) = Error;
}
