import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserNameWidget extends StatelessWidget {
  final String uid;

  const UserNameWidget({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final CollectionReference fetchdatauser =
        FirebaseFirestore.instance.collection('user2');

    return StreamBuilder<QuerySnapshot>(
      stream: fetchdatauser.where('uid', isEqualTo: uid).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          final DocumentSnapshot documentSnapshot = snapshot.data!.docs.first;
          final String? userName = documentSnapshot['name'];

          return SizedBox(
            height: 50,
            width: double.infinity,
            child: Text(
              userName ?? 'Loading...',
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
}
