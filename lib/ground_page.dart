import 'package:flutter/material.dart';
import 'package:newapp/page/Favorite.dart';
import 'package:newapp/page/Home.dart';
import 'package:newapp/page/Join.dart';
import 'package:newapp/page/More.dart';
import 'package:newapp/widgets/drawer.dart';

class Ground extends StatefulWidget {
  const Ground({super.key});

  @override
  State<Ground> createState() => _GroundState();
}

class _GroundState extends State<Ground> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = <Widget>[
    Home(),
    Join(),
    Favorite(),
    More(),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Menu(scaffoldKey: _scaffoldKey),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0, // Adjust title spacing as needed
      ),
      endDrawer: const drawer(),
      body: SingleChildScrollView(
          child: _pages
              .elementAt(_selectedIndex)), // Show the selected page directly
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.headset_mic),
                label: 'Join',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: 'More',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
    required GlobalKey<ScaffoldState> scaffoldKey,
  }) : _scaffoldKey = scaffoldKey;

  final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      color: const Color.fromARGB(255, 187, 203, 122),
      child: IconButton(
        onPressed: () {
          _scaffoldKey.currentState?.openEndDrawer();
        },
        icon: const Icon(
          Icons.grid_view,
          size: 35,
          color: Color.fromARGB(255, 1, 60, 64),
        ),
      ),
    );
  }
}
