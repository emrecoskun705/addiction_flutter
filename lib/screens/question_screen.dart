import 'package:addiction_app/models/question.dart';
import 'package:addiction_app/screens/confirm_screen.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/question_bank.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:addiction_app/constants.dart';

class QuestionScreen extends StatefulWidget {
  final AddictionType type;

  QuestionScreen({required this.type});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Question> questions;
  int questionNumber = 0;

  int trueCount = 0;
  int falseCount = 0;

  @override
  void initState() {
    if (widget.type == AddictionType.alcohol) {
      questions = QuestionBank.alcoholAddiction;
    } else if (widget.type == AddictionType.smoke) {
      questions = QuestionBank.smokeAddiction;
    } else {
      // technology
      questions = QuestionBank.technologyAddiction;
    }
    super.initState();
  }

  List<Icon> trueFalseList = [];

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
                  InfoBubbleWidget(
                      message:
                          'Doğru cevapları ver, puanları kazan. Sen de bir ünvan kazan. Bu bölümün ünvanı "Çaylak Mücadeleci"'),
                  Center(
                    child: Text(
                      'Soru ${questionNumber + 1}',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(35)),
                    ),
                  ),
                  buildQuestion(questions[questionNumber].question),
                  RoundedButton(
                      title: 'Doğru',
                      bgColor: Colors.green,
                      onPressed: () {
                        if (questions[questionNumber].answer == true) {
                          trueCount++;
                          trueFalseList.add(trueIcon);
                        } else {
                          falseCount++;
                          trueFalseList.add(falseIcon);
                        }

                        if (questionNumber + 1 != questions.length) {
                          setState(() {
                            questionNumber++;
                          });
                        } else {
                          questionNumber++;
                        }

                        //check if it is the last question
                        if (questionNumber == questions.length) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmScreen()),
                              (route) => route.isFirst);
                        }
                      }),
                  RoundedButton(
                      title: 'Yanlış',
                      bgColor: Colors.red,
                      onPressed: () {
                        if (questions[questionNumber].answer == false) {
                          trueCount++;
                          trueFalseList.add(trueIcon);
                        } else {
                          trueFalseList.add(falseIcon);
                          falseCount++;
                        }

                        if (questionNumber + 1 != questions.length) {
                          setState(() {
                            questionNumber++;
                          });
                        } else {
                          questionNumber++;
                        }

                        //check if it is the last question
                        if (questionNumber == questions.length) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ConfirmScreen()),
                              (route) => false);
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
