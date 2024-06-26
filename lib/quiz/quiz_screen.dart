import 'package:flutter/material.dart';
import 'package:newapp/quiz/result_screen.dart';

class quiz_screen extends StatefulWidget {
  const quiz_screen({super.key});

  @override
  State<quiz_screen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<quiz_screen> {
  List quizListData = [
    {
      "id": 1,
      "answer": "30%",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "A mine or part there of may be treated as naturally wet if the roadway dust sample \r\ncontain_______or more of moisture by weight.",
      "options": [
        {
          "option": "a",
          "value": "10%",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "15%",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "20%",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "30%",
          "color": "0xFFFFFFFF",
        },
      ],
    },
    {
      "id": 2,
      "answer": "25 cm",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "The thickness of ventilation stopping constructed of masonary or brickwork shall be _______cms \r\nin thickness",
      "options": [
        {
          "option": "a",
          "value": "20 cm",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "15 cm",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "25 cm",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "10 cm",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e",
          "value": "18 cm",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 3,
      "answer": "Mine Managers",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "M.V.T. Rules 1966 shall not apply to the following persons",
      "options": [
        {
          "option": "a",
          "value": "Timber man",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "Coal driller",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "Coal driller",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "Mine Managers",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e",
          "value": "Haulage attendents",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 4,
      "answer": "3",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title": "Mine Managers",
      "options": [
        {
          "option": "a",
          "value": "3",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "2",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "1",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e",
          "value": "Not required",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 5,
      "answer": "1 year",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "As per M.V.T. Rules 1966 every person holding a gast testing certificate shall once in __________ \r\nundergo a course of training as detailed in 8th schedule of M V T Rules 1966.",
      "options": [
        {
          "option": "a",
          "value": "5 years",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "1 year",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "2 years",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "3years",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e",
          "value": "4years",
          "color": "0xFFFFFFFF",
        }
      ],
    },
    {
      "id": 6,
      "answer": "8m",
      "answer_discription": "",
      "is_answered": 0,
      "is_answer_status_right_wrong_omitted": 0,
      "title":
          "Main Mechanical Ventilator of a mine shall be installed on the surface at a distance of not less \r\nthan _____ from the opening of the shaft or inlcine",
      "options": [
        {
          "option": "a",
          "value": "10m",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "b",
          "value": "8m",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "c",
          "value": "7m",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "d",
          "value": "5m",
          "color": "0xFFFFFFFF",
        },
        {
          "option": "e",
          "value": "4m",
          "color": "0xFFFFFFFF",
        }
      ],
    },
  ];

  final _pageController = PageController(initialPage: 0);
  int questionINdex = 0;

  int userPercentage = 0;
  int wrongQ = 0;
  int ommitedQuestion = 0;
  int totalRight = 0;

  void quizResult(BuildContext context) {
    int userPercentage = 0;
    int wrongQ = 0;
    int ommitedQuestion = 0;
    int totalRight = 0;

    for (int i = 0; i < quizListData.length; i++) {
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 0) {
        ommitedQuestion++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 1) {
        totalRight++;
      }
      if (quizListData[i]['is_answer_status_right_wrong_omitted'] == 2) {
        wrongQ++;
      }
    }

    userPercentage = ((totalRight / quizListData.length) * 100).round();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          userPercentage: userPercentage,
          totalRight: totalRight,
          wrongQ: wrongQ,
          ommitedQuestion: ommitedQuestion,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 60, 64),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          "Quiz Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question :${questionINdex + 1}/${quizListData.length}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: quizListData.length,
                onPageChanged: (page) {
                  debugPrint("Current page $page");
                  setState(
                    () {
                      questionINdex = page;
                    },
                  );
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 255, 186),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            quizListData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      quizListData[index]
                                  ['is_answer_status_right_wrong_omitted'] ==
                              2
                          ? Text(
                              "Sorry : Right answer is -> ${quizListData[index]['answer']} ",
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                      ...quizListData[index]['options']
                          .map(
                            (data) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Color(
                                        int.parse(
                                          data['color'],
                                        ),
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (quizListData[index]['is_answered'] ==
                                          0) {
                                        setState(() {
                                          if (data['value'] ==
                                              quizListData[index]['answer']) {
                                            data['color'] = "0xFF31CD63";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 1;
                                          } else {
                                            data['color'] = "0xFFFF0000";
                                            quizListData[index][
                                                'is_answer_status_right_wrong_omitted'] = 2;
                                          }
                                          quizListData[index]['is_answered'] =
                                              1;
                                        });
                                      } else {}
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 0),
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Color(
                                                int.parse(
                                                  data['color'],
                                                ),
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Text(
                                                data['option'].toUpperCase(),
                                                style: const TextStyle(
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            data['value'],
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (questionINdex == quizListData.length - 1) {
            debugPrint("Submit ");
            quizResult(context);
          } else {
            debugPrint("ELSE PART");
            _pageController.nextPage(
              duration: const Duration(milliseconds: 5),
              curve: Curves.easeIn,
            );
          }
        },
        backgroundColor: const Color.fromARGB(255, 241, 255, 186),
        label: Text(
          questionINdex == quizListData.length - 1 ? "Submit" : "Next",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
