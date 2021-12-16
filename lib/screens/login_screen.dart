import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/info_text_field.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoginScreen extends StatelessWidget {
  TextEditingController classText = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController parents = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future<void> addUser() {
      CollectionReference userInfo =
          FirebaseFirestore.instance.collection('users');
      return userInfo.add({'deneme': 'denem1', 'deneme2': 'deneme2'});
    }

    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
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
                    children: [
                      InfoBubbleWidget(
                          message:
                              'Lütfen anketin daha verimli olması için bilgilerinizi girer misiniz'),
                      InfoTextField(
                          hint: 'Yaşınızı giriniz',
                          prefixIcon: Icons.eight_k,
                          controller: classText),
                      InfoTextField(
                          hint: 'Sınıfınızı giriniz',
                          prefixIcon: Icons.eight_k,
                          controller: age),
                      InfoTextField(
                          hint: 'Sınıfınızı giriniz',
                          prefixIcon: Icons.eight_k,
                          controller: gender),
                      InfoTextField(
                          hint: 'Sınıfınızı giriniz',
                          prefixIcon: Icons.eight_k,
                          controller: parents),
                      RoundedButton(
                          title: 'click',
                          bgColor: Colors.lightBlue,
                          onPressed: () {
                            addUser();
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
