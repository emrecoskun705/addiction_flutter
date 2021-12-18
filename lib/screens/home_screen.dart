import 'package:addiction_app/constants.dart';
import 'package:addiction_app/screens/question_screen.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String userId;

  HomeScreen(this.userId);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(30),
                    horizontal: getProportionateScreenWidth(30)),
                child: Text(
                  'Mücadeleye Basla',
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(50),
                    fontFamily: butterflyFont,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InfoBubbleWidget(
                      message:
                          'Her seviyede yeni bir ünvan kazan! Tüm görevleri tamamla sen de mücadeleci ol.'),
                  buildLevelBox(
                      colour: Color(0xFFF2FF7A),
                      isCurrent: true,
                      title: 'Teknoloji Bagımlılıgı',
                      context: context,
                      type: AddictionType.technology),
                  buildLevelBox(
                      colour: Colors.blueAccent,
                      isCurrent: false,
                      title: 'Sigara Bagımlılıgı    ',
                      context: context,
                      type: AddictionType.smoke),
                  buildLevelBox(
                      colour: Colors.redAccent,
                      isCurrent: false,
                      title: 'Alkol Bagımlılıgı      ',
                      context: context,
                      type: AddictionType.alcohol),
                ],
              ),
              InfoBubbleWidget(
                message:
                    'Her seviyede yeni bir ünvan kazan! Tüm görevleri tamamla sen de mücadeleci ol.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLevelBox(
      {required Color colour,
      required bool isCurrent,
      required String title,
      required BuildContext context,
      required AddictionType type}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuestionScreen(type: type)));
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: getProportionateScreenWidth(120),
            top: getProportionateScreenHeight(10),
            bottom: getProportionateScreenHeight(10)),
        child: Row(
          children: [
            SizedBox(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: colour,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(8),
                    horizontal: getProportionateScreenWidth(8)),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: getProportionateScreenHeight(19),
                    fontFamily: flavorsFont,
                  ),
                ),
              ),
            ),
            isCurrent
                ? Icon(
                    Icons.arrow_back,
                    size: getProportionateScreenHeight(30),
                  )
                : SizedBox(),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
