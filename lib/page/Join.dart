import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/live/LivePage.dart';
import 'package:newapp/widgets/menu.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  bool ishost = false;
  final _formKey = GlobalKey<FormState>(); // For form validation
  final subjectController = TextEditingController(); // For subject input
  final teacherNameController = TextEditingController(); //
  final RoomIdController = TextEditingController();
  final CollectionReference fetchdataLiveClass =
      FirebaseFirestore.instance.collection('liveclassdata');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              menu(),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const CreateLiveClassDialog();
                },
              );

              print('Create a Live Class');
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 255, 186),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 100,
              width: 345,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Create a Live Class\nLet's Start",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: 'Font1',
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Live List",
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: 'Font1', fontSize: 26, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
              height: 300,
              width: 345,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Color.fromARGB(255, 241, 255, 186),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: fetchdataLiveClass.snapshots(),
                builder: (context, snapshort) {
                  if (!snapshort.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  var document = snapshort.data!.docs;
                  return ListView.builder(
                    itemCount: document.length,
                    itemBuilder: (context, Index) {
                      var data = document[Index].data() as Map<String, dynamic>;
                      var subject = data['subject'];
                      var teacherName = data['teacherName'];
                      // return Text(subject);
                      return ListTile(
                        title: Text(subject ?? "No subject"),
                        subtitle: Text(teacherName ?? "No Teacher"),
                      );
                    },
                  );
                },
              )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subjectController.dispose();
    teacherNameController.dispose();
    RoomIdController.dispose();
  }
}

// Container(
//   height: 350,
//   width: 328,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.all(
//       Radius.circular(50),
//     ),
//     color: Color.fromARGB(255, 241, 255, 186),
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(14.0),
//             child: Container(
//               height: 100,
//               width: 100,
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(10)),
//                 color: Color.fromARGB(255, 223, 241, 149),
//               ),
//               child: const Icon(
//                 Icons.person,
//                 size: 90,
//                 color: Color.fromARGB(255, 1, 60, 64),
//               ),
//             ),
//           ),
//         ],
//       ),
//       const SizedBox(
//         height: 5,
//       ),
//       Padding(
//         padding: const EdgeInsets.only(
//           left: 20,
//         ),
//         child: Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Electrical Circuits',
//                 style: Theme.of(context)
//                     .textTheme
//                     .bodyLarge!
//                     .copyWith(
//                         fontFamily: 'Font1',
//                         fontSize: 28,
//                         fontWeight: FontWeight.w600),
//               ),
//               const SizedBox(
//                 height: 8,
//               ),
//               const Text(
//                 "Course Code    :CSE325",
//                 style: TextStyle(fontFamily: 'Font2', fontSize: 18),
//               ),
//               const Text(
//                 "Teacher Name  :DR.Karim Islam",
//                 style: TextStyle(fontFamily: 'Font2', fontSize: 18),
//               ),
//               const Text(
//                 "Email                :karim@diu.edu.bd",
//                 style: TextStyle(fontFamily: 'Font2', fontSize: 18),
//               ),
//               const Text(
//                 "Phone               :0123457895",
//                 style: TextStyle(fontFamily: 'Font2', fontSize: 18),
//               ),
//               // media()
//             ],
//           ),
//         ),
//       ),
//     ],
//   ),
// ),

class CreateLiveClassDialog extends StatefulWidget {
  const CreateLiveClassDialog({super.key});

  @override
  State<CreateLiveClassDialog> createState() => _CreateLiveClassDialogState();
}

class _CreateLiveClassDialogState extends State<CreateLiveClassDialog> {
  final _formKey = GlobalKey<FormState>();
  final RoomIdController = TextEditingController();
  final subjectController = TextEditingController();
  final teacherNameController = TextEditingController();
  final CollectionReference fetchdataLiveClass =
      FirebaseFirestore.instance.collection('liveclassdata');
  bool ishost = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 1, 60, 64),
      title: const Text(
        'Create a Live Class',
        style: TextStyle(color: Colors.white, fontFamily: 'Font1'),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min, // Avoid potential overflow
          children: [
            TextFormField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: RoomIdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                label: Text("Room ID"),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Room Id.';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: subjectController, // Bind subject input
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 8, 140, 147), // Set border color
                    width: 1.0, //
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color:
                        Color.fromARGB(255, 123, 237, 243), // Set border color
                    width: 1.0, // Set border width (optional)
                  ),
                ),
                // fillColor: Color.fromARGB(255, 255, 255, 255),
                labelText: 'Subject',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a subject.';
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              controller: teacherNameController,
              decoration: const InputDecoration(
                labelText: 'Teacher Name',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 8, 140, 147), // Set border color
                    width: 1.0, //
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 8, 140, 147), // Set border color
                    width: 1.0,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a teacher name.';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'Is Host ?',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontFamily: 'Font1',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 4),
                Switch(
                    value: ishost,
                    onChanged: (val) {
                      setState(() {
                        ishost = val;
                      });
                    })
              ],
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all<Size>(const Size(100.0, 40.0)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    5), // Set your desired radius value here (e.g., 10.0, 20.0)
              ),
            ),
            backgroundColor:
                WidgetStateProperty.all(const Color.fromARGB(255, 7, 123, 130)),
          ),
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Font1', fontSize: 16),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all<Size>(const Size(100.0, 40.0)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    5), // Set your desired radius value here (e.g., 10.0, 20.0)
              ),
            ),
            backgroundColor:
                WidgetStateProperty.all(const Color.fromARGB(255, 7, 123, 130)),
          ),
          onPressed: () async {
            // Form validation
            if (_formKey.currentState!.validate()) {
              String subject = subjectController.text;
              String teacherName = teacherNameController.text;

              // Save data to Firestore
              await fetchdataLiveClass.add({
                'subject': subject,
                'teacherName': teacherName,
                // Add any other desired fields
              });

              // Show success message and close dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Live class created successfully!'),
                ),
              );
              // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              //   builder: (context) {
              //     return LivePage(
              //       roomID: RoomIdController.text,
              //       isHost: ishost,
              //       userId:
              //           teacherNameController.text.replaceAll(' ', ' ').trim(),
              //       userName: teacherNameController.text,
              //     );
              //   },
              // ), (route) => false);
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LivePage(
                      roomID: RoomIdController.text,
                      isHost: ishost,
                      userId: teacherNameController.text
                          .replaceAll(' ', ' ')
                          .trim(),
                      userName: teacherNameController.text,
                    );
                  },
                ),
              );
            }
          },
          child: const Text(
            'Create',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Font1', fontSize: 16),
          ),
        ),
      ],
    );
  }
}
