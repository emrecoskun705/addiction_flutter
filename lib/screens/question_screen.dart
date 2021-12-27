import 'package:addiction_app/models/question.dart';
import 'package:addiction_app/screens/confirm_screen.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/question_bank.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:addiction_app/constants.dart';

class QuestionScreen extends StatefulWidget {
  final AddictionType type;
  final String userId;

  QuestionScreen({required this.type, required this.userId});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Question> questions;
  late String chosenType;

  int questionNumber = 0;

  int trueCount = 0;
  int falseCount = 0;

  @override
  void initState() {
    if (widget.type == AddictionType.alcohol) {
      questions = QuestionBank.alcoholAddiction;
      chosenType = 'Alkol';
    } else if (widget.type == AddictionType.smoke) {
      questions = QuestionBank.smokeAddiction;
      chosenType = 'Sigara';
    } else {
      // technology
      questions = QuestionBank.technologyAddiction;
      chosenType = 'Teknoloji';
    }
    super.initState();
  }

  List<Icon> trueFalseList = [];
  List<String> userScoreList = [];

  List<Question> falseQuestions = [];

  Icon trueIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: getProportionateScreenHeight(40),
  );

  Icon falseIcon = Icon(
    Icons.close,
    color: Colors.red,
    size: getProportionateScreenHeight(40),
  );

  Future addTaskResult() {
    CollectionReference result =
        FirebaseFirestore.instance.collection('results');
    return result.add({
      'kullanici': widget.userId,
      'bagimlilikTuru': chosenType,
      'dogruSayisi': trueCount,
      'yanlisSayisi': falseCount,
      'kullaniciSkoru': userScoreList,
      'olusturuldu': FieldValue.serverTimestamp()
    });
  }

  void goBackToPreviousQuestion() {
    if (questionNumber != 0) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFC6FFDD),
                Color(0xFFFBD786),
                Color(0xFFF7797d),
              ]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      '$chosenType Bağımlılığı',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(25)),
                    ),
                  ),
                  InfoBubbleWidget(
                      message:
                          'Aşağıda verilen soruları okuyup doğru cevapları vermeye çalış, eğer yanlış cevapların olursa testin sonunda kontrol edebilirsin.'),
                  Center(
                    child: Text(
                      'Soru ${questionNumber > questions.length - 1 ? questions.length : questionNumber + 1}',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(35)),
                    ),
                  ),
                  buildQuestion(questions[questionNumber > questions.length - 1
                          ? questions.length - 1
                          : questionNumber]
                      .question),
                  RoundedButton(
                      title: 'Doğru',
                      bgColor: Colors.green,
                      onPressed: () async {
                        if (questions[questionNumber].answer == true) {
                          trueCount++;
                          trueFalseList.add(trueIcon);
                          userScoreList.add('Dogru');
                        } else {
                          // if answer is false show a dialog about correct answer
                          await (AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            width: getProportionateScreenWidth(380),
                            title: 'Yanlış cevap verdiniz',
                            desc: questions[questionNumber].info,
                            showCloseIcon: true,
                          ).show());
                          falseCount++;
                          trueFalseList.add(falseIcon);
                          userScoreList.add('Yanlis');
                          falseQuestions.add(questions[questionNumber]);
                        }

                        setState(() {
                          questionNumber++;
                        });

                        //check if it is the last question
                        if (questionNumber == questions.length) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                              title: Text('Sonuç'),
                              content: Text(
                                  'Sonuçlarınızı göndermek için lütfen butona tıklayınız.'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      await addTaskResult();
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmScreen(
                                                    trueCount: trueCount,
                                                    falseCount: falseCount,
                                                    scoreList: userScoreList,
                                                    falseQuestions:
                                                        falseQuestions,
                                                  )),
                                          (route) => route.isFirst);
                                    },
                                    child: Text('Gönder'))
                              ],
                            ),
                          );
                        }
                      }),
                  RoundedButton(
                      title: 'Yanlış',
                      bgColor: Colors.red,
                      onPressed: () async {
                        if (questions[questionNumber].answer == false) {
                          trueCount++;
                          trueFalseList.add(trueIcon);
                          userScoreList.add('Dogru');
                        } else {
                          // if answer is false show a dialog about correct answer
                          await (AwesomeDialog(
                            context: context,
                            dialogType: DialogType.ERROR,
                            width: getProportionateScreenWidth(380),
                            title: 'Yanlış cevap verdiniz',
                            desc: questions[questionNumber].info,
                            showCloseIcon: true,
                          ).show());
                          trueFalseList.add(falseIcon);
                          falseCount++;
                          userScoreList.add('Yanlis');
                          falseQuestions.add(questions[questionNumber]);
                        }

                        setState(() {
                          questionNumber++;
                        });

                        //check if it is the last question
                        if (questionNumber == questions.length) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog(
                              title: Text('Sonuç'),
                              content: Text(
                                  'Sonuçlarınızı göndermek için lütfen butona tıklayınız.'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () async {
                                      await addTaskResult();
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConfirmScreen(
                                                    trueCount: trueCount,
                                                    falseCount: falseCount,
                                                    scoreList: userScoreList,
                                                    falseQuestions:
                                                        falseQuestions,
                                                  )),
                                          (route) => route.isFirst);
                                    },
                                    child: Text('Gönder'))
                              ],
                            ),
                          );
                        }
                      }),
                ],
              ),
              Row(
                children: trueFalseList.map((e) => e).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildQuestion(String question) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(10),
          vertical: getProportionateScreenHeight(20)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(5),
                horizontal: getProportionateScreenWidth(5)),
            child: Text(
              question,
              style: TextStyle(fontSize: getProportionateScreenHeight(25)),
            ),
          ),
        ),
      ),
    );
  }
}
