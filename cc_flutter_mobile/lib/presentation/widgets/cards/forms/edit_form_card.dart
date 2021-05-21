import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/textfields/custom_text_field.dart';

class EditFormCard extends StatefulWidget {
  @override
  _EditFormCardState createState() => _EditFormCardState();
}

class _EditFormCardState extends State<EditFormCard> {
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
            Text('Complete the process to change your information', style: TextStyle(color: Colors.white54, fontSize: 16.0),),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Name',
              prefixIconData: Icons.face,
              isPassword: false,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Last name',
              prefixIconData: Icons.face,
              isPassword: false,
            ),
            SizedBox(
              height: space,
            ),
            CustomTextField(
              labelText: 'Phone',
              prefixIconData: Icons.phone,
              isPassword: false,
            ),
          ],
        ),
      ),
    );
  }
}
