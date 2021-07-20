import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:look_good/Tabs/catergory.dart';
import 'package:look_good/Tabs/hometab.dart';
import 'package:look_good/Tabs/search.dart';
import 'package:look_good/Widgets%20and%20buttons/actionBar.dart';
import 'package:look_good/Widgets%20and%20buttons/menuDrawer.dart';
import 'package:look_good/Widgets%20and%20buttons/navigation_tabs.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  PageController _tabsPageController;
  int _selectedTab = 0;


  @override
  void initState() {
    _tabsPageController = PageController();
    super.initState();
  }

  @override
  void dispose(){
    _tabsPageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
      ),
      drawer: MenuDrawer(
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: PageView(
              controller: _tabsPageController,
              onPageChanged: (num){
                  setState(() {
                    _selectedTab = num;
                  });
              },
              children: [
                homeTab(

                ),
                Search(

                ),
                catergory(

                ),
              ],
            ),
          ),
          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (num){
              setState(() {
                _tabsPageController.animateToPage(num,
                    duration: Duration(microseconds: 300),
                    curve: Curves.easeOutCubic);
              });
            },
          )
        ],
      ),
    );
  }
}
