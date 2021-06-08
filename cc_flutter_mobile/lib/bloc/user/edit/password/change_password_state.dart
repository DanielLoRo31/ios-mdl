import 'package:cc_flutter_mobile/bloc/user/edit/submit_password.dart';

class ChangePasswordState {
  final String currentPassword;
  final String newPassword;
  final String confirmPassword;
  final FormStatus formStatus;

  ChangePasswordState({
    this.currentPassword = '',
    this.newPassword = '',
    this.confirmPassword = '',
    this.formStatus = const InitialFormStatus(),
  });

  ChangePasswordState copyWith({
    String currentPassword,
    String newPassword,
    String confirmPassword,
    FormStatus formStatus,
  }) {
    return ChangePasswordState(
      currentPassword: currentPassword ?? this.currentPassword,
      newPassword: newPassword ?? this.newPassword,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}