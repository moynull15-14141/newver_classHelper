import 'package:flutter/material.dart';
import 'package:newapp/page/Favorite.dart';
import 'package:newapp/page/Home.dart';
import 'package:newapp/page/Join.dart';
import 'package:newapp/page/More.dart';

class Ground extends StatefulWidget {
  const Ground({
    super.key,
  });

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Center(
              child: _pages.elementAt(_selectedIndex),
            ),
            Positioned(
                bottom: 8.0,
                left: 0.0,
                right: 0.0,
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
                ))
          ],
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
