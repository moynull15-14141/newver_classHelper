import 'package:flutter/material.dart';
import 'package:newapp/quiz/quiz_screen.dart';

class quiz_topic extends StatelessWidget {
  const quiz_topic({super.key});
  final List subjectListData = const [
    {"subject_name": "ICT", "subject_id": "1001"},
    {"subject_name": "English", "subject_id": "1002"},
    {"subject_name": "Science", "subject_id": "1003"},
    {"subject_name": "Math", "subject_id": "1004"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz',
          style: TextStyle(
            fontFamily: "Font2",
            color: Color.fromARGB(255, 1, 60, 64),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quiz Topic',
              style: TextStyle(
                fontFamily: "Font2",
                fontSize: 24,
                color: Color.fromARGB(255, 1, 60, 64),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 1, 60, 64),
            ),
            const SizedBox(
              height: 10,
            ),
            ...subjectListData.map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListTile(
                    onTap: () {
                      debugPrint(e['subject_id']);

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const quiz_screen(),
                        ),
                      );
                    },
                    tileColor: const Color.fromARGB(255, 1, 60, 64),
                    textColor: Colors.white,
                    iconColor: Colors.white,
                    title: Text(
                      e['subject_name'],
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
