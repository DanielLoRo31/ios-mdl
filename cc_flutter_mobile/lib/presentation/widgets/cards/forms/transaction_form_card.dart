import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/custom_text_field.dart';

class TransactionFormCard extends StatefulWidget {
  @override
  _TransactionFormCardState createState() => _TransactionFormCardState();
}

class _TransactionFormCardState extends State<TransactionFormCard> {
  bool _isBankAccount = false;
  IconData _accountIcon = Icons.code;

  void _isBankAccountValidation () {
    if (_isBankAccount) {
      setState(() {
        _accountIcon = Icons.credit_card;
      });
      return;
    }
    if (_isBankAccount) {
      setState(() {
        _accountIcon = Icons.code;
      });
      return;
    }
    setState(() {
      _accountIcon = Icons.code;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      color: Palette.lightBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Fill the information to make a transaction', style: TextStyle(color: Colors.white54, fontSize: 16.0),),
            SizedBox(
              height: space,
            ),
            SwitchListTile(
                activeColor: Palette.lightGreen,
                value: _isBankAccount,
                title: Text(
                  'Bank account',
                  style: TextStyle(color: Colors.white),
                ),
                onChanged: (v) {
                  setState(() {
                    _isBankAccount = !_isBankAccount;
                    _isBankAccountValidation();
                  });

                }),
            CustomTextField(
              labelText: 'Destination',
              prefixIconData: this._accountIcon,
              isPassword: false,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Quantity',
              prefixIconData: Icons.mail_outline,
              isPassword: false,
            ),
          ],
        ),
      ),
    );
  }
}
