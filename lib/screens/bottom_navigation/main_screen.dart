import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bersihkebun/constant.dart';
import 'package:bersihkebun/screens/bottom_navigation/home_screen.dart';
import 'package:bersihkebun/pages/form/bersihtaman.dart';
import 'package:bersihkebun/widgets/grab_bottom_navigation_item.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static ScrollController _hideButtonController;
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),

  ];

  bool _isVisible = true;
  @override
  void initState() {
    super.initState();
    _isVisible = true;
    _hideButtonController = new ScrollController();
    _hideButtonController.addListener(() {
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _isVisible = false;
          print("**** $_isVisible up");
        });
      }
      if (_hideButtonController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _isVisible = true;
          print("**** $_isVisible down");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
        // resizeToAvoidBottomPadding: false,
        duration: Duration(milliseconds: 10),
        height:
            _isVisible ? MediaQuery.of(context).viewPadding.bottom + 70 : 0.0,
        child: BottomAppBar(
          elevation: 8,
          color: Colors.white,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: GrabBottomNavigationItem(
                    icon: FontAwesomeIcons.compass,
                    iconActive: FontAwesomeIcons.solidCompass,
                    title: "Home",
                    onTap: () {
                      _selectedIndex = 0;
                      setState(() {});
                    },
                    isActive: _selectedIndex == 0,
                  ),
                ),




              ],
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _hideButtonController,
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _widgetOptions.elementAt(_selectedIndex);
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}
