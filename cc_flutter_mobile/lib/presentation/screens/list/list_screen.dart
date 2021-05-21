import 'package:flutter/material.dart';
// Config
import 'package:cc_flutter_mobile/config/design_paddings.dart';
import 'package:cc_flutter_mobile/config/design_spacings.dart';
import 'package:cc_flutter_mobile/config/palette.dart';
// My packages
import 'package:cc_flutter_mobile/presentation/widgets/list_widgets.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Widget> _hardcodedList = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      _hardcodedList.add(ListCard(
        transactionType: 0,
        concept: 'Hello human!',
        quantity: 0.0,
        from: 'Me',
        date: '0 day',
        transactionStatus: 0,
      ));
      _hardcodedList.add(ListCard(
        transactionType: 1,
        concept: 'Hello human!',
        quantity: 0.0,
        from: 'Me',
        date: '0 day',
        transactionStatus: 1,
      ));
      _hardcodedList.add(ListCard(
        transactionType: 0,
        concept: 'Hello human!',
        quantity: 0.0,
        from: 'Me',
        date: '0 day',
        transactionStatus: 2,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    var height =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    var space = height > 650 ? DesignSpacings.spaceM : DesignSpacings.spaceS;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Palette.blackBg,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: DesignPaddings.paddingL),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Colors.transparent,
              expandedHeight: 320,
              automaticallyImplyLeading: false,
              floating: true,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TitleCard(
                      content: 'Check your all transactions',
                      title: 'Transactions list',
                      styleType: 'Surprise',
                      width: 50,
                      fSize1: 18,
                      height: 50,
                      fSize2: 16,
                    ),
                    SizedBox(
                      height: space,
                    ),
                    StatusCard(),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 2 * space,
                  ),
                  Center(
                    child: Icon(
                      Icons.swap_vert,
                      color: Palette.darkGreen,
                    ),
                  ),
                  SizedBox(
                    height: 2 * space,
                  ),
                  Card(
                    margin: EdgeInsets.only(bottom: 25),
                    color: Palette.lightBlack,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Filters',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 3 * space,
                          ),
                          CustomToggleButtons(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: space,
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: Theme(
                        data: ThemeData(
                          accentColor: Palette.lightGreen,
                        ),
                        child: ListView(
                          children: _hardcodedList,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: space,
                  ),
                  GoToCard(
                    mainText: "Wrong section? ",
                    toGoText: 'Go back to Status screen',
                    onTap: null,
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
