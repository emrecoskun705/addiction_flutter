import 'package:addiction_app/screens/home_screen.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/screens/widgets/info_text_field.dart';
import 'package:addiction_app/screens/widgets/rounded_button_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_radio_group/flutter_radio_group.dart';
import 'dart:async';

import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController classText = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController parents = TextEditingController();

  bool _isLoading = false;

  final _listHorizontal = ["Sağ", "Hayatta değil"];
  final _parentRelation = ['Birlikte', 'Ayrı'];
  int? _parentIndex = null;
  int? _indexHorizontal = null;
  int? _indexHorizontal2 = null;
  Gender? selectedGender = null;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    Future addUser(
        {required int? age,
        required int studentClass,
        required String gender,
        required String motherAlive,
        required String fatherAlive,
        required String familyTogether}) {
      CollectionReference userInfo =
          FirebaseFirestore.instance.collection('users');
      return userInfo.add({
        'yas': age,
        'sinif': studentClass,
        'cinsiyet': gender,
        'anne': motherAlive,
        'baba': fatherAlive,
        'birlikte': familyTogether,
        'olusturuldu': FieldValue.serverTimestamp()
      });
    }

    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isLoading,
        child: SingleChildScrollView(
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
                      controller: age),
                  InfoTextField(
                      hint: 'Sınıfınızı giriniz',
                      prefixIcon: Icons.eight_k,
                      controller: classText),
                  GenderPickerWithImage(
                    onChanged: (Gender? gender) {
                      setState(() {
                        selectedGender = gender;
                      });
                    },
                    maleText: 'Erkek',
                    femaleText: 'Kadın',
                    selectedGender: selectedGender,
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
                        defaultSelected: _indexHorizontal2,
                        orientation: RGOrientation.HORIZONTAL,
                        onChanged: (index) {
                          setState(() {
                            _indexHorizontal2 = index;
                          });
                        }),
                  ),
                  _indexHorizontal == 0 && _indexHorizontal2 == 0
                      ? Padding(
                          padding: EdgeInsets.only(
                              left: getProportionateScreenHeight(20)),
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
                        )
                      : SizedBox(),
                  Center(
                    child: RoundedButton(
                        title: 'Başla',
                        bgColor: Colors.lightBlue,
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          if (age.text == '' ||
                              classText.text == '' ||
                              selectedGender == null ||
                              _indexHorizontal == null ||
                              _indexHorizontal2 == null) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Lütfen tüm alanları doldurunuz'),
                            ));
                            setState(() {
                              _isLoading = false;
                            });
                            return;
                          }

                          var deneme = await addUser(
                              age: int.parse(age.text),
                              studentClass: int.parse(classText.text),
                              gender: selectedGender == Gender.Male
                                  ? 'erkek'
                                  : 'kadin',
                              motherAlive: _indexHorizontal == 0
                                  ? 'Sag'
                                  : 'Hayatta degil',
                              fatherAlive: _indexHorizontal2 == 0
                                  ? 'Sag'
                                  : 'Hayatta degil',
                              familyTogether:
                                  _parentIndex == 0 ? 'Birlikte' : 'Ayri');

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen(deneme.id)),
                              (route) => false);
                        }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
