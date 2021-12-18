import 'package:addiction_app/screens/home_screen.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class ConfirmScreen extends StatelessWidget {
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
                      '3 doğru 2 yanlış cevap verdiniz, sonuçlarınız anketin verimliliği için kayıt altına alınmıştır'),
              Row(
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
                        '3',
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
                        '3',
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(40),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              RoundedButton(
                  title: 'Ana menüye dönmek için tıklayınız',
                  bgColor: Colors.lightBlueAccent,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
