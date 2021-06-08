import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeCard extends StatefulWidget {
  const QRCodeCard({Key key}) : super(key: key);

  @override
  _QRCodeCardState createState() => _QRCodeCardState();
}

class _QRCodeCardState extends State<QRCodeCard> {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      elevation: 4,
      color: Palette.lightBlack,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Center(
              child: Text('Sometimes is faster if you scan the QR code',
                  style: TextStyle(color: Colors.white70)),
            ),
            SizedBox(
              height: space,
            ),
            QrImage(
              data: "HERE_LIES_YOUR_CODE",
              version: QrVersions.auto,
              backgroundColor: Colors.white60,
              size: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
