import 'package:addiction_app/consts.dart';
import 'package:addiction_app/screens/widgets/info_bubble_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                'Mücadeleye Basla',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: butterflyFontName,
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
                    colour: Colors.amber,
                    isCurrent: true,
                    title: '1. Seviye Mücadele'),
                buildLevelBox(
                    colour: Colors.amber,
                    isCurrent: false,
                    title: '2. Seviye Mücadele'),
                buildLevelBox(
                    colour: Colors.amber,
                    isCurrent: false,
                    title: '3. Seviye Mücadele'),
              ],
            ),
            InfoBubbleWidget(
              message:
                  'Her seviyede yeni bir ünvan kazan! Tüm görevleri tamamla sen de mücadeleci ol.',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLevelBox(
      {required Color colour, required bool isCurrent, required String title}) {
    return Padding(
      padding: EdgeInsets.only(left: 100, top: 10, bottom: 10),
      child: Row(
        children: [
          SizedBox(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: colour,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          isCurrent ? Icon(Icons.arrow_back) : SizedBox(),
          SizedBox(),
        ],
      ),
    );
  }
}
