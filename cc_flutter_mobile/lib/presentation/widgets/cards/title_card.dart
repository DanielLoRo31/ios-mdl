import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/logos_path.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:flutter/material.dart';

class TitleCard extends StatelessWidget {
  final String title;
  final String content;
  final String styleType;
  final double width;
  final double height;
  final double fSize1;
  final double fSize2;

  TitleCard({
    @required this.title,
    @required this.content,
    @required this.styleType,
    @required this.width,
    @required this.height,
    @required this.fSize1,
    @required this.fSize2
  });

  String _validateEmotions() {
    switch(this.styleType) {
      case 'Happy':
        return LogoPath.rHappyLogoPath;
        break;
      case 'Sad':
        return LogoPath.rSadDeadLogoPath;
        break;
      case 'Smile':
        return LogoPath.rSmileLogoPath;
        break;
      case 'Surprise':
        return LogoPath.rSurpriseMFLogoPath;
        break;
      case 'Love':
        return LogoPath.rILoveULogoPath;
        break;
      case 'Email':
        return LogoPath.rGotAnEmailLogoPath;
        break;
      case 'Mad':
        return LogoPath.rImReallyMadLogoPath;
        break;
      case 'Idea':
        return LogoPath.rIHaveAnIdeaLogoPath;
        break;
      default:
        return LogoPath.rHappyLogoPath;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var _height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = _height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Card(
      color: Palette.lightBlack,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Image(
              image: AssetImage(_validateEmotions()),
              width: this.width,
              height: this.height,
            ),
            SizedBox(
              height: space,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(25, 5, 15, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: this.fSize1,
                    ),
                  ),
                  SizedBox(
                    height: space,
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: this.fSize2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
