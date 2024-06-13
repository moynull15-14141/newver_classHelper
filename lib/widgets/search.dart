import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  List<DocumentSnapshot> _foundUsers = [];

  void _runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      setState(() {
        _foundUsers = [];
      });
    } else {
      _usersCollection
          .where('name', isGreaterThanOrEqualTo: enteredKeyword)
          .where('name', isLessThan: '${enteredKeyword}z')
          .get()
          .then((QuerySnapshot querySnapshot) {
        setState(() {
          _foundUsers = querySnapshot.docs;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(49),
      elevation: 3.0,
      shadowColor: const Color.fromARGB(255, 1, 60, 64),
      child: TextField(
        controller: _searchController,
        onChanged: _runFilter,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromARGB(255, 241, 255, 186),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 15,
          ),
          hintText: 'Search',
          prefixIcon: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.search,
              size: 28,
              color: Color.fromARGB(255, 1, 60, 64),
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(49.0),
          ),
        ),
      ),
    );
  }
}
