import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:spark2021app/bottomNavigatonWidgets/collab_widget.dart';
import 'package:spark2021app/bottomNavigatonWidgets/domains_widget.dart';
import 'package:spark2021app/bottomNavigatonWidgets/faq_widget.dart';
import 'package:spark2021app/bottomNavigatonWidgets/home_widget.dart';
import 'package:spark2021app/bottomNavigatonWidgets/timeline_widget.dart';
import 'package:spark2021app/states/background_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    TimeLineWidget(),
    DomainsWidget(),
    CollaborationWidget(),
    FAQWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF001B31),
        body: Stack(children: [
          BackgroundGradientWidget(),
          _widgetOptions.elementAt(_selectedIndex),
        ]),
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: SnakeBarBehaviour.floating,
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 15),
          snakeShape: SnakeShape.indicator,
          showSelectedLabels: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          items: [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'images/homeIcon.png',
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'images/timelineIcon.png',
                ),
              ),
              label: 'Timeline',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'images/domainsIcon.png',
                ),
              ),
              label: 'Domain',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'images/collabIcon.png',
                ),
              ),
              label: 'Associate',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(
                  'images/faqIcon.png',
                ),
              ),
              label: 'FAQ',
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.white,
          selectedItemColor: Color(0xFF4BD0FB),
          snakeViewColor: Color(0xFF4BD0FB),
          backgroundColor: Color(0xFF3E5466),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
