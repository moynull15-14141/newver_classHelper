import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/widgets/box1.dart';
import 'package:newapp/widgets/menu.dart';
import 'package:newapp/widgets/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference fetchdata =
      FirebaseFirestore.instance.collection('user');

  final CollectionReference fetchdatauser =
      FirebaseFirestore.instance.collection('user2');
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String? userName;

  Future<void> delet(String productId) async {
    await fetchdata.doc(productId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 14, left: 14, right: 14),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  hello(context),
                  const menu(),
                ],
              ),
              // user Name showing
              StreamBuilder<User?>(
                stream: firebaseAuth.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final user = snapshot.data!; // Get logged-in user
                    return UserNameGet(
                        user.uid, firebaseAuth); // Pass _auth instance
                  } else {
                    return const Text('Please sign in'); // Prompt to sign in
                  }
                },
              ),
              const Search(),
              const SizedBox(height: 10),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Live Class",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Font1',
                            fontSize: 42,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: Image.asset("image/live.png"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 3.0, // Set here what you wish!
                    shadowColor: const Color.fromARGB(255, 1, 60, 64),
                    child: Container(
                      height: 360,
                      width: 355,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 241, 255, 186),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  box1(
                                    onTap: () {},
                                    height: 140,
                                    width: 140,
                                    imageUrl: "image/physics.png",
                                    imageUrl2: "image/pl.png",
                                    text: "Physics",
                                    heightIm: 80,
                                    widthIm: 80,
                                  ),
                                  box1(
                                    onTap: () {},
                                    heightIm: 85,
                                    widthIm: 85,
                                    height: 140,
                                    width: 140,
                                    imageUrl: "image/co3.png",
                                    imageUrl2: "image/pl.png",
                                    text: "Computer",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  box1(
                                    onTap: () {},
                                    height: 140,
                                    width: 140,
                                    imageUrl: "image/physics.png",
                                    imageUrl2: "image/pl.png",
                                    text: "Physics",
                                    heightIm: 80,
                                    widthIm: 80,
                                  ),
                                  box1(
                                    onTap: () {},
                                    heightIm: 85,
                                    widthIm: 85,
                                    height: 140,
                                    width: 140,
                                    imageUrl: "image/co3.png",
                                    imageUrl2: "image/pl.png",
                                    text: "Computer",
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  box1(
                                    onTap: () {},
                                    height: 140,
                                    width: 140,
                                    imageUrl: "image/physics.png",
                                    imageUrl2: "image/pl.png",
                                    text: "Physics",
                                    heightIm: 80,
                                    widthIm: 80,
                                  ),
                                  box1(
                                    onTap: () {},
                                    heightIm: 85,
                                    widthIm: 85,
                                    height: 140,
                                    width: 140,
                                    imageUrl: "image/co3.png",
                                    imageUrl2: "image/pl.png",
                                    text: "Computer",
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Activity",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Font1',
                            fontSize: 42,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: Image.asset("image/active.png"),
                      ),
                    ],
                  ),
                ],
              ),

              // StreamBuilder for Firebase data

              StreamBuilder<QuerySnapshot>(
                stream: fetchdata.snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true, // Prevent list from expanding
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        final DocumentSnapshot documentSnapshot =
                            snapshot.data!.docs[index];
                        return Material(
                          child: ListTile(
                            trailing: IconButton(
                              onPressed: () => delet(documentSnapshot.id),
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                            title: Text(documentSnapshot['name']),
                            subtitle: Text(documentSnapshot['id']),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  StreamBuilder<QuerySnapshot<Object?>> UserNameGet(
      String uid, FirebaseAuth auth) {
    return StreamBuilder<QuerySnapshot>(
      stream: fetchdatauser.where('uid', isEqualTo: uid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final DocumentSnapshot documentSnapshot = snapshot.data!.docs.first;
          userName = documentSnapshot['name']; // Update state variable

          return SizedBox(
            height: 50,
            width: double.infinity,
            child: Text(
              userName ??
                  'Loading...', // Display loading message or default value
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontFamily: 'Font1',
                    fontSize: 30,
                  ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Padding hello(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 0),
      child: Text("Hello",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: 'Font1', fontSize: 18)),
    );
  }
}
