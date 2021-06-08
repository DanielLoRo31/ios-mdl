import 'package:cc_flutter_mobile/bloc/user/edit/submit_data.dart';

class EditDataState {
  final String email;
  final String phone;
  final int id;
  final String name;
  final String lastName;
  final FormStatus formStatus;

  EditDataState({
    this.email = '',
    this.phone = '',
    this.id = 0,
    this.name = '',
    this.lastName = '',
    this.formStatus = const InitialFormStatus(),
  });

  EditDataState copyWith({
    String email,
    String password,
    String phone,
    int id,
    String name,
    String lastName,
    FormStatus formStatus,
  }) {
    return EditDataState(
      email: email ?? this.email,
      phone: phone ?? this.phone,
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: name ?? this.lastName,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}