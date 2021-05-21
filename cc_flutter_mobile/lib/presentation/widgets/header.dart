import 'package:flutter/material.dart';
// My packages
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/logos_path.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/presentation/widgets/logos/logo_cc.dart';

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              LogoCCWidget(color: Palette.lightGreen, image: Image(
                width: 50,
                height: 50,
                image: AssetImage(LogoPath.ccLogoPath),
              ),),
              SizedBox(
                height: DesignSpacings.spaceM,
              ),
              Text(
                'Cash Coin',
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white.withOpacity(0.8)),
              ),
            ],
          ),
          SizedBox(
            height: DesignSpacings.spaceS,
          ),
          Text(
            'Save, Transfer, Learn',
            style: TextStyle(color: Colors.white54.withOpacity(0.5)),
          )
        ],
      ),
    );
  }
}
