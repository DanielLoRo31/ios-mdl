import 'package:cc_flutter_mobile/bloc/authentication/auth_blocs.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/presentation/widgets/buttons/custom_button.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/fields_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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


  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : CustomButton(
              title: 'Log In',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }
                Navigator.of(context).pushNamed('status');
              },
              buttonType: 4);
    });
  }

  Widget _emailField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
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
          validator: (value) =>
              state.isValidEmail ? null : 'Username is too short',
          onChanged: (value) => context.read<LoginBloc>().add(
                EmailChanged(email: value),
              ),
        ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: _obscureText,
          decoration: FieldsDecorations(
                  label: 'Password',
                  prefixIconData: Icons.lock,
                  suffixIconData: _ifIsPassword('yes'))
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          validator: (value) =>
              state.isValidPassword ? null : 'password is too short',
          onChanged: (value) => context.read<LoginBloc>().add(
                PasswordChanged(password: value),
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

    return BlocListener<LoginBloc, LoginState>(
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
            _emailField(),
            SizedBox(
              height: space,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _passwordField(),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: null,
                )
              ],
            ),
            SizedBox(
              height: 2 * space,
            ),
            _loginButton(),
          ],
        ),
      ),
    );
  }
}
