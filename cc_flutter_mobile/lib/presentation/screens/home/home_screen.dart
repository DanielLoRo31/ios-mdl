import 'package:cc_flutter_mobile/presentation/widgets/cards/options_card.dart';
import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/palette.dart';
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
// BLOC
import 'package:cc_flutter_mobile/bloc/authentication/auth_blocs.dart';
// My packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cc_flutter_mobile/data/repositories/auth_repository.dart';
import 'package:cc_flutter_mobile/presentation/screens/home/widgets/login_form_card.dart';
import 'package:cc_flutter_mobile/presentation/screens/home/widgets/welcome_card.dart';
import 'package:cc_flutter_mobile/presentation/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Palette.blackBg,
        body: BlocProvider(
          create: (context) => LoginBloc(
            userRepository: context.read<AuthenticationRepository>(),
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
                WelcomeCard(),
                SizedBox(
                  height: 2 * space,
                ),
                LoginFormCard(),
                SizedBox(
                  height: 2 * space,
                ),
                OptionsCard(
                  onTap: () => Navigator.of(context).pushNamed('signup'),
                ),
              ],
            ),
          ),
        ));
  }
}
