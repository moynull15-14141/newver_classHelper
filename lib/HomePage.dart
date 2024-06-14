import 'package:flutter/material.dart';
import 'package:newapp/page/Favorite.dart';
import 'package:newapp/page/Home.dart';
import 'package:newapp/page/Join.dart';
import 'package:newapp/page/More.dart';

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
            child: Container(
              height: 50,
              width: 50,
              color: const Color.fromARGB(255, 187, 203, 122),
              child: IconButton(
                onPressed: () {
                  print("home page see");
                  _scaffoldKey.currentState?.openEndDrawer();
                },
                icon: const Icon(
                  Icons.grid_view,
                  size: 35,
                  color: Color.fromARGB(255, 1, 60, 64),
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0, // Adjust title spacing as needed
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
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
