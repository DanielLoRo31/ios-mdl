import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cc_flutter_mobile/bloc/user/register/register_blocs.dart';
import 'package:cc_flutter_mobile/bloc/user/register/submit_status.dart';
import 'package:cc_flutter_mobile/data/repositories/auth_repository.dart';
import 'package:cc_flutter_mobile/bloc/user/register/signup/signup_state.dart';
import 'package:cc_flutter_mobile/bloc/user/register/signup/signup_event.dart';
import 'package:cc_flutter_mobile/data/repositories/user_repository.dart';


class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final UserRepository userRepository;

  SignupBloc({this.userRepository}) : super(SignupState());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is EmailChanged) {
      yield state.copyWith(email: event.email);
    }
    else if (event is PasswordChanged) {
      yield state.copyWith(password: event.password);
    }
    else if (event is PhoneChanged) {
      yield state.copyWith(password: event.phone);
    }
    else if (event is NameChanged) {
      yield state.copyWith(password: event.name);
    }
    else if (event is LastNameChanged) {
      yield state.copyWith(password: event.lastName);
    }
    else if (event is SignUpSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await userRepository.registerAccount();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}
