import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatelessWidget {
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
                      'Aşama 1',
                      style:
                          TextStyle(fontSize: getProportionateScreenHeight(35)),
                    ),
                  ),
                  buildQuestion(),
                  RoundedButton(
                      title: 'Doğru', bgColor: Colors.green, onPressed: () {}),
                  RoundedButton(
                      title: 'Yanlış', bgColor: Colors.red, onPressed: () {}),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.close,
                    color: Colors.red,
                    size: getProportionateScreenHeight(40),
                  ),
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: getProportionateScreenHeight(40),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildQuestion() {
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
              'İnsanlarla internet üzerinden konuşmayı yüz yüze konuşmaya tercih etmek teknoloji bağımlılığının belirtilerinden biridir.',
              style: TextStyle(fontSize: getProportionateScreenHeight(25)),
            ),
          ),
        ),
      ),
    );
  }
}
