import 'package:cc_flutter_mobile/bloc/user/edit/password_blocs.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/presentation/widgets/buttons/custom_button.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/fields_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordForm extends StatefulWidget {
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<PasswordForm> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  IconData _suffixIcon = Icons.visibility_off;

  Widget _ifIsPassword(String isPassword) {
    if (isPassword == 'no') {
      return null;
    }
    return IconButton(
      onPressed: _changePassword,
      icon: Icon(
        _suffixIcon,
        size: 18,
        color: Colors.white70,
      ),
    );
  }

  void _changePassword() {
    if (_obscureText) {
      setState(() {
        _obscureText = false;
        _suffixIcon = Icons.visibility;
      });
      return;
    }
    if (!_obscureText) {
      setState(() {
        _obscureText = true;
        _suffixIcon = Icons.visibility_off;
      });
      return;
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _submitChangesButton() {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : CustomButton(
          title: 'Sign Up',
          onPressed: () {
            if (_formKey.currentState.validate()) {
              context.read<ChangePasswordBloc>().add(ChangeSubmitted());
            }
            Navigator.of(context).pushNamed('status');
          },
          buttonType: 4);
    });
  }

  Widget _currentPasswordField() {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
              label: 'Email',
              prefixIconData: Icons.email,
              suffixIconData: _ifIsPassword('no'))
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          validator: null,
          onChanged: (value) => context.read<ChangePasswordBloc>().add(
            CurrentPasswordChanged(currentPassword: value),
          ),
        ),
      );
    });
  }

  Widget _newPasswordField() {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
              label: 'Phone',
              prefixIconData: Icons.phone,
              suffixIconData: _ifIsPassword('no'))
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<ChangePasswordBloc>().add(
            NewPasswordChanged(newPassword: value),
          ),
        ),
      );
    });
  }

  Widget _confirmPasswordField() {
    return BlocBuilder<ChangePasswordBloc, ChangePasswordState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
              label: 'Name',
              prefixIconData: Icons.person,
              suffixIconData: _ifIsPassword('no'))
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<ChangePasswordBloc>().add(
            ConfirmPasswordChanged(confirmPassword: value),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return BlocListener<ChangePasswordBloc, ChangePasswordState>(
      listener: (context, state) {
        final formStatus = state.formStatus;
        if (formStatus is SubmissionFailed) {
          _showSnackBar(context, formStatus.exception.toString());
        }
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Fill the information to authenticate',
              style: TextStyle(color: Colors.white54, fontSize: 16.0),
            ),
            SizedBox(
              height: 2 * space,
            ),
            _currentPasswordField(),
            SizedBox(
              height: space,
            ),
            _newPasswordField(),
            SizedBox(
              height: space,
            ),
            _confirmPasswordField(),
            SizedBox(
              height: space,
            ),
            SizedBox(
              height: 2 * space,
            ),
            _submitChangesButton(),
          ],
        ),
      ),
    );
  }
}