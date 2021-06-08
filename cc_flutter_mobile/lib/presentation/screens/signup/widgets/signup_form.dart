import 'package:cc_flutter_mobile/bloc/user/register/register_blocs.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/buttons/custom_button.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/fields_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  PageController _pageController = new PageController(initialPage: 0);
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  IconData _suffixIcon = Icons.visibility_off;

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

  Widget _signUpButton() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : CustomButton(
              title: 'Sign Up',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context.read<SignupBloc>().add(SignUpSubmitted());
                }
                Navigator.of(context).pushNamed('status');
              },
              buttonType: 4);
    });
  }

  Widget _emailField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
            label: 'Email',
            prefixIconData: Icons.email,
          ).buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          validator: (value) =>
              state.isValidEmail ? null : 'Username is too short',
          onChanged: (value) => context.read<SignupBloc>().add(
                EmailChanged(email: value),
              ),
        ),
      );
    });
  }

  Widget _passwordField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: _obscureText,
          decoration: FieldsDecorations(
              label: 'Password',
              prefixIconData: Icons.lock,
              suffixIconData: IconButton(
                onPressed: _changePassword,
                icon: Icon(
                  _suffixIcon,
                  size: 18,
                  color: Colors.white70,
                ),
              )).buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          validator: (value) =>
              state.isValidPassword ? null : 'Password is too short',
          onChanged: (value) => context.read<SignupBloc>().add(
                PasswordChanged(password: value),
              ),
        ),
      );
    });
  }

  Widget _phoneField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
                  label: 'Phone',
                  prefixIconData: Icons.phone,)
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<SignupBloc>().add(
                PhoneChanged(phone: value),
              ),
        ),
      );
    });
  }

  Widget _nameField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
                  label: 'Name',
                  prefixIconData: Icons.person,)
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<SignupBloc>().add(
                NameChanged(name: value),
              ),
        ),
      );
    });
  }

  Widget _lastNameField() {
    return BlocBuilder<SignupBloc, SignupState>(builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
                  label: 'Last name',
                  prefixIconData: Icons.person,)
              .buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<SignupBloc>().add(
                LastNameChanged(lastName: value),
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

    return BlocListener<SignupBloc, SignupState>(
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
                'Fill the information for your account',
                style: TextStyle(color: Colors.white54, fontSize: 16.0),
              ),
              SizedBox(
                height: space,
              ),
              Container(
                height: 275,
                child: PageView(
                  controller: _pageController,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          _emailField(),
                          SizedBox(
                            height: space,
                          ),
                          _passwordField(),
                          SizedBox(
                            height: space,
                          ),
                          _phoneField(),
                          SizedBox(
                            height: 1.3 * space,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'swipe right to fill your personal information',
                                style: TextStyle(
                                    color: Colors.white30, fontSize: 12.0),
                              ),
                              SizedBox(
                                width: space,
                              ),
                              Icon(
                                Icons.swipe,
                                color: Palette.darkGreen,
                                size: 16.0,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          _nameField(),
                          SizedBox(
                            height: space,
                          ),
                          _lastNameField(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _signUpButton(),
            ],
          )),
    );
  }
}
