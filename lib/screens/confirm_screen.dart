import 'package:addiction_app/models/question.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
  final int trueCount;
  final int falseCount;
  final List<String> scoreList;
  final List<Question> falseQuestions;

  ConfirmScreen(
      {required this.trueCount,
      required this.falseCount,
      required this.scoreList,
      required this.falseQuestions});

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoBubbleWidget(
                  message:
                      '$trueCount doğru $falseCount yanlış cevap verdiniz, sonuçlarınız anketin verimliliği için kayıt altına alınmıştır'),
              buildTrueFalse(),
              falseCount != 0
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(20)),
                      child: Center(
                          child: Text(
                        'Doğru cevaplar',
                        style: TextStyle(
                            fontSize: getProportionateScreenHeight(25)),
                      )),
                    )
                  : SizedBox(),
              falseCount != 0
                  ? Flexible(
                      child: ListView.builder(
                          itemCount: falseCount,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text(
                                '${index + 1}',
                                style: TextStyle(
                                    fontSize: getProportionateScreenHeight(35),
                                    fontWeight: FontWeight.bold),
                              ),
                              title: Text(falseQuestions[index].info),
                            );
                          }),
                    )
                  : SizedBox(),
              RoundedButton(
                  title: 'Ana menüye dönmek için tıklayınız',
                  bgColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTrueFalse() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(
              Icons.check,
              color: Colors.green,
              size: getProportionateScreenHeight(90),
            ),
            Text(
              '$trueCount',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(40),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              Icons.close,
              color: Colors.red,
              size: getProportionateScreenHeight(90),
            ),
            Text(
              '$falseCount',
              style: TextStyle(
                fontSize: getProportionateScreenHeight(40),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
