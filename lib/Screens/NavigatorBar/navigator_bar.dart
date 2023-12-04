import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:mylibrary/Screens/Screens/App/Search.dart';
import 'package:mylibrary/Screens/Screens/App/category.dart';
import 'package:mylibrary/Screens/Screens/App/favorite.dart';
import 'package:mylibrary/Screens/Screens/App/home_screen.dart';
import 'package:mylibrary/database/service/hivedatabase.dart';

class NavigatorScreen extends StatefulWidget {
  const NavigatorScreen({super.key});

  @override
  State<NavigatorScreen> createState() => _NavigatorBarState();
}

class _NavigatorBarState extends State<NavigatorScreen> {
  @override
  void initState() {
    setcurrentuser();
    super.initState();
  }

  Future<void> setcurrentuser() async {
    currentuser = FirebaseAuth.instance.currentUser!.uid;
    getFavorite();
    print('user-- $currentuser');
  }

  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    const HomeScreen(),
    const Categories(),
    const Favorite(),
    const Search(),
  ];

  @override
  Widget build(BuildContext context) {
    const items = <Widget>[
      Icon(
        Icons.home,
        size: 30,
        color: Color.fromARGB(255, 97, 225, 101),
      ),
      Icon(
        Icons.explore,
        size: 30,
        color: Color.fromARGB(255, 97, 225, 101),
      ),
      Icon(
        Icons.favorite,
        size: 30,
        color: Color.fromARGB(255, 97, 225, 101),
      ),
      Icon(
        Icons.search,
        size: 30,
        color: Color.fromARGB(255, 97, 225, 101),
      ),
    ];
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        backgroundColor: Colors.black,
        buttonBackgroundColor: Colors.black,
        height: 50.0,
        items: items,
        onTap: (index) => setState(() => this.index = index),
      ),
    );
  }
}
