import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/info_text_field.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'dart:async';

import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController classText = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController parents = TextEditingController();

  final _listHorizontal = ["Sağ", "Hayatta değil"];
  final _parentRelation = ['Birlikte yaşıyor', 'Ayrı'];
  int? _parentIndex = null;
  int? _indexHorizontal = null;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future<void> addUser() {
      CollectionReference userInfo =
          FirebaseFirestore.instance.collection('users');
      return userInfo.add({'deneme': 'denem1', 'deneme2': 'deneme2'});
    }

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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                GenderPickerWithImage(
                  onChanged: (Gender? gender) {},
                  maleText: 'Erkek',
                  femaleText: 'Kadın',
                  selectedGender: null,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenHeight(20)),
                  child: FlutterRadioGroup(
                      titles: _listHorizontal,
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenHeight(15),
                          fontWeight: FontWeight.bold),
                      labelVisible: true,
                      label: "Anne",
                      activeColor: Colors.blue,
                      titleStyle: TextStyle(fontSize: 14),
                      defaultSelected: _indexHorizontal,
                      orientation: RGOrientation.HORIZONTAL,
                      onChanged: (index) {
                        setState(() {
                          _indexHorizontal = index;
                        });
                      }),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenHeight(20)),
                  child: FlutterRadioGroup(
                      titles: _listHorizontal,
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenHeight(15),
                          fontWeight: FontWeight.bold),
                      labelVisible: true,
                      label: "Baba",
                      activeColor: Colors.blue,
                      titleStyle: TextStyle(fontSize: 14),
                      defaultSelected: _indexHorizontal,
                      orientation: RGOrientation.HORIZONTAL,
                      onChanged: (index) {
                        setState(() {
                          _indexHorizontal = index;
                        });
                      }),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenHeight(20)),
                  child: FlutterRadioGroup(
                      titles: _parentRelation,
                      labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: getProportionateScreenHeight(15),
                          fontWeight: FontWeight.bold),
                      labelVisible: true,
                      label: "Aile Durumu",
                      activeColor: Colors.blue,
                      titleStyle: TextStyle(fontSize: 14),
                      defaultSelected: _parentIndex,
                      orientation: RGOrientation.HORIZONTAL,
                      onChanged: (index) {
                        setState(() {
                          _parentIndex = index;
                        });
                      }),
                ),
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
}
