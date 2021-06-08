import 'package:cc_flutter_mobile/bloc/user/edit/submit_password.dart';
import 'package:cc_flutter_mobile/data/repositories/user_repository.dart';
import 'package:cc_flutter_mobile/bloc/user/edit/password/change_password_event.dart';
import 'package:cc_flutter_mobile/bloc/user/edit/password/change_password_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final UserRepository userRepository;

  ChangePasswordBloc({this.userRepository}) : super(ChangePasswordState());

  @override
  Stream<ChangePasswordState> mapEventToState(ChangePasswordEvent event) async* {
    // Username updated
    if (event is CurrentPasswordChanged) {
      yield state.copyWith(currentPassword: event.currentPassword);

      // Password updated
    } else if (event is NewPasswordChanged) {
      yield state.copyWith(newPassword: event.newPassword);

      // Form submitted
    } else if (event is ConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);

      // Form submitted
    } else if (event is ChangeSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await userRepository.editAccount();
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e));
      }
    }
  }
}