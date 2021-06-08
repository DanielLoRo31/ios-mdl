import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Config
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/config/design_paddings.dart';
// My packages
import 'package:cc_flutter_mobile/bloc/user/register/register_blocs.dart';
import 'package:cc_flutter_mobile/data/repositories/user_repository.dart';
import 'package:cc_flutter_mobile/presentation/screens/signup/widgets/signup_form_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/title_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/header.dart';
import 'package:cc_flutter_mobile/presentation/widgets/cards/options_card.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.blackBg,
      body: BlocProvider(
        create: (context) => SignupBloc(
          userRepository: context.read<UserRepository>(),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              HeaderSection(),
              SizedBox(
                height: 2 * space,
              ),
              TitleCard(
                content:
                    'Fill the fields, register\nand be welcome to CashCoin',
                title: 'Sign Up Form :)',
                styleType: 'Smile',
                width: 50,
                fSize1: 18,
                height: 50,
                fSize2: 16,
              ),
              SizedBox(
                height: 2 * space,
              ),
              SgnUpFormCard(),
              SizedBox(
                height: 4 * space,
              ),
              OptionsCard(
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
