import 'package:cc_flutter_mobile/bloc/user/register/submit_status.dart';

class SignupState {
  final String email;
  bool get isValidEmail => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String name;
  final String lastName;
  final FormStatus formStatus;

  SignupState({
    this.email = '',
    this.password = '',
    this.name = '',
    this.lastName = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignupState copyWith({
    String email,
    String password,
    String name,
    String lastName,
    FormStatus formStatus,
  }) {
    return SignupState(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      lastName: name ?? this.name,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
