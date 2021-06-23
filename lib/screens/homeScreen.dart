import 'package:flutter/material.dart';

import 'everything.dart';
import 'topHeadines.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        //appBar: AppBar(title: Text('Newsy'),),
        body: SafeArea(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(deviceSize.height / 4 / 2),
                    child: AppBar(
                        backgroundColor: Colors.white,
                        title: Text(
                          'Newsy',
                          style: TextStyle(color: Colors.black),
                        ),
                        bottom: TabBar(
                          // indicatorSize: TabBarIndicatorSize.label,
                          // labelPadding: EdgeInsets.only(bottom: 5),
                          unselectedLabelColor: Colors.grey,
                          indicatorColor: Colors.purple,
                          indicatorPadding: EdgeInsets.zero,
                          labelColor: Colors.purple,
                          isScrollable: true,

                          tabs: [
                            FittedBox(
                              child: Container(
                                margin: EdgeInsets.only(
                                    right: deviceSize.width / 4 / 3),
                                child: Text(
                                  'Top Headlines',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            FittedBox(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: deviceSize.width / 4 / 3,
                                ),
                                child: Text(
                                  'Everything',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],

                          //  bottom:
                          //title: Text('Tabs Demo'),
                        )),
                  ),
                  body: TabBarView(children: [
                    Topheadlines(),
                    Everything(),
                  ]),
                ))),
      ]),
    ));
  }
}
