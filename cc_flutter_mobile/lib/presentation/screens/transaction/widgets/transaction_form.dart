import 'package:cc_flutter_mobile/bloc/transaction/make/make_transaction_blocs.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/buttons/custom_button.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/fields_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionForm extends StatefulWidget {
  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isBankAccount = false;
  IconData _accountTypeIcon = Icons.code;
  String _accountTypeText = 'Account Code';

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _makeTransactionButton() {
    return BlocBuilder<MakeTransactionBloc, MakeTransactionState>(
        builder: (context, state) {
      return state.formStatus is FormSubmitting
          ? CircularProgressIndicator()
          : CustomButton(
              title: 'Sign Up',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  context
                      .read<MakeTransactionBloc>()
                      .add(TransactionSubmitted());
                }
                Navigator.of(context).pushNamed('status');
              },
              buttonType: 4);
    });
  }

  Widget _quantityField() {
    return BlocBuilder<MakeTransactionBloc, MakeTransactionState>(
        builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          keyboardType: TextInputType.number,
          obscureText: false,
          decoration: FieldsDecorations(
            label: 'Email',
            prefixIconData: Icons.email,
          ).buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<MakeTransactionBloc>().add(
                QuantityChanged(quantity: double.parse(value)),
              ),
        ),
      );
    });
  }

  Widget _destinationCodeField() {
    return BlocBuilder<MakeTransactionBloc, MakeTransactionState>(
        builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
            label: 'Phone',
            prefixIconData: _accountTypeIcon,
          ).buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<MakeTransactionBloc>().add(
                DestinationCodeChanged(code: value),
              ),
        ),
      );
    });
  }

  Widget _conceptField() {
    return BlocBuilder<MakeTransactionBloc, MakeTransactionState>(
        builder: (context, state) {
      return Material(
        elevation: 8,
        color: Colors.transparent,
        child: TextFormField(
          obscureText: false,
          decoration: FieldsDecorations(
            label: 'Name',
            prefixIconData: Icons.person,
          ).buildTextFieldDecoration(),
          style: TextStyle(color: Colors.white70, fontSize: 14.0),
          onChanged: (value) => context.read<MakeTransactionBloc>().add(
                ConceptChanged(concept: value),
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

    return BlocListener<MakeTransactionBloc, MakeTransactionState>(
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
                'Fill the information to make a transaction',
                style: TextStyle(color: Colors.white54, fontSize: 16.0),
              ),
              SizedBox(
                height: space,
              ),
              SwitchListTile(
                activeColor: Palette.lightGreen,
                value: _isBankAccount,
                title: Text(
                  _accountTypeText,
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (bool value) {
                  if(value) {
                    setState(() {
                      _isBankAccount = value;
                      _accountTypeIcon = Icons.credit_card;
                      _accountTypeText = 'Bank account';
                    });
                    _showSnackBar(context, 'Method not supported');
                    return;
                  }
                  if(!value) {
                    setState(() {
                      _isBankAccount = value;
                      _accountTypeIcon = Icons.code;
                      _accountTypeText = 'Account Code';
                    });
                    return;
                  }
                },
              ),
              SizedBox(
                height: space,
              ),
              _quantityField(),
              SizedBox(
                height: space,
              ),
              _destinationCodeField(),
              SizedBox(
                height: space,
              ),
              _conceptField(),
              SizedBox(
                height: 2 * space,
              ),
              _makeTransactionButton(),
            ],
          )),
    );
  }
}
