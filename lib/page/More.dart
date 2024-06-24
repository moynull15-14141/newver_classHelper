import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:newapp/quiz/quiz_topic.dart';
import 'package:newapp/widgets/box2.dart';
import 'package:newapp/widgets/get_user_name.dart';
import 'dart:io';

class More extends StatefulWidget {
  const More({super.key});

  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> _pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File file = File(pickedFile.path);
      User? user = firebaseAuth.currentUser;

      if (user != null) {
        String fileName = 'profile_pictures/${user.uid}.png';
        try {
          // Upload image to Firebase Storage
          await storage.ref(fileName).putFile(file);
          String downloadURL = await storage.ref(fileName).getDownloadURL();

          // Update Firestore with the new profile picture URL
          await firestore.collection('users').doc(user.uid).update({
            'profilePicture': downloadURL,
          });

          // Update UI
          setState(() {});
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }
  }

  Widget _buildProfilePicture(String? imageUrl) {
    return GestureDetector(
      onTap: _pickAndUploadImage,
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 1, 60, 64),
        radius: 25,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
        child: imageUrl == null
            ? const Icon(
                Icons.person,
                size: 28,
                color: Colors.white,
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    User? user = firebaseAuth.currentUser;

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Color.fromARGB(255, 241, 255, 186),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: firestore
                        .collection('users')
                        .doc(user?.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        var userData =
                            snapshot.data!.data() as Map<String, dynamic>?;
                        String? profilePictureUrl = userData?['profilePicture'];
                        return _buildProfilePicture(profilePictureUrl);
                      } else {
                        return _buildProfilePicture(null);
                      }
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: StreamBuilder<User?>(
                      stream: firebaseAuth.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final user = snapshot.data!; // Get logged-in user
                          return UserNameWidget(
                              uid: user.uid); // Pass the user ID
                        } else {
                          return const Text(
                              'Please sign in'); // Prompt to sign in
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 485,
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                color: Color.fromARGB(255, 241, 255, 186),
              ),
              child: Column(
                children: [
                  Box2(
                    onTap: () {},
                    box2name: "Attendance",
                    box2Icon: const Icon(Icons.co_present),
                  ),
                  Box2(
                    onTap: () {},
                    box2name: "Recording",
                    box2Icon: const Icon(Icons.record_voice_over),
                  ),
                  Box2(
                    onTap: () {},
                    box2name: "Class Schedule",
                    box2Icon: const Icon(Icons.schedule),
                  ),
                  Box2(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => quiz_topic()));
                    },
                    box2name: "Quiz",
                    box2Icon: const Icon(Icons.verified),
                  ),
                  Box2(
                    onTap: () {},
                    box2name: "My Course",
                    box2Icon: const Icon(Icons.subject),
                  ),
                  Box2(
                    onTap: () {},
                    box2name: "Offline Content",
                    box2Icon: const Icon(Icons.content_copy),
                  ),
                  Box2(
                    onTap: () {},
                    box2name: "About Us",
                    box2Icon: const Icon(Icons.abc),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
