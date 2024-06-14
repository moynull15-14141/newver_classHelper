import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/live/LivePage.dart';

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
  void dispose() {
    super.dispose();
    subjectController.dispose();
    teacherNameController.dispose();
    RoomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      backgroundColor: const Color.fromARGB(255, 1, 60, 64),
      title: const Text(
        'Create a Live Class',
        style: TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontFamily: 'Font2',
            fontWeight: FontWeight.w500),
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
                enabledBorder: OutlineInputBorder(
                  // Set border for non-focused state
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 7, 123,
                        130), // Set desired non-focused border color
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 8, 140, 147), // Set border color
                    width: 1.0, //
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                ),
                label: Text("Room Id"),
                labelStyle: TextStyle(color: Colors.white),
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
                enabledBorder: OutlineInputBorder(
                  // Set border for non-focused state
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 7, 123,
                        130), // Set desired non-focused border color
                    width: 1.0,
                  ),
                ),
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
                labelStyle: TextStyle(color: Colors.white),
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
                errorBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red), // Set error border color
                ),
                enabledBorder: OutlineInputBorder(
                  // Set border for non-focused state
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 7, 123,
                        130), // Set desired non-focused border color
                    width: 1.0,
                  ),
                ),
                labelText: 'T./S. Name',
                labelStyle: TextStyle(color: Colors.white),
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
              height: 0,
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
                    inactiveTrackColor: const Color.fromARGB(255, 3, 60, 63),
                    inactiveThumbColor: const Color.fromARGB(255, 38, 115, 120),
                    activeColor: const Color.fromARGB(255, 9, 159, 167),
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
            fixedSize: WidgetStateProperty.all<Size>(const Size(148.0, 40.0)),
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
            'Create & Join',
            style: TextStyle(
                color: Colors.white, fontFamily: 'Font1', fontSize: 16),
          ),
        ),
      ],
    );
  }
}