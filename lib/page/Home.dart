import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:newapp/widgets/box1.dart';
import 'package:newapp/widgets/get_user_name.dart';
import 'package:newapp/widgets/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CollectionReference fetchdata =
      FirebaseFirestore.instance.collection('user');
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> delet(String productId) async {
    await fetchdata.doc(productId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 18, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              hello(context),
            ],
          ),
          StreamBuilder<User?>(
            stream: firebaseAuth.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final user = snapshot.data!; // Get logged-in user
                return UserNameWidget(uid: user.uid); // Pass the user ID
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
                elevation: 3.0,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          StreamBuilder<QuerySnapshot>(
            stream: fetchdata.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
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
    );
  }

  Padding hello(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, left: 0),
      child: Text("Hello",
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontFamily: 'Font1', fontSize: 18)),
    );
  }
}
