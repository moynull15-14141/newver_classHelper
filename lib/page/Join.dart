import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newapp/widgets/alertdilog.dart';

class Join extends StatefulWidget {
  const Join({super.key});

  @override
  State<Join> createState() => _JoinState();
}

class _JoinState extends State<Join> {
  bool ishost = false;
  // final _formKey = GlobalKey<FormState>(); // For form validation
  final subjectController = TextEditingController(); // For subject input
  final teacherNameController = TextEditingController(); //
  final roomIdController = TextEditingController();
  final CollectionReference fetchdataLiveClass =
      FirebaseFirestore.instance.collection('liveclassdata');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 18,
        right: 18,
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // menu(),
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
            },
            child: Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 241, 255, 186),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 100,
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
}
