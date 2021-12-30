import 'package:addiction_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoBubbleWidget extends StatelessWidget {
  final String message;

  InfoBubbleWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/svg/octocat.svg',
              height: getProportionateScreenHeight(50),
            ),
            Container(
              margin: EdgeInsets.only(left: getProportionateScreenWidth(20)),
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(8),
                  horizontal: getProportionateScreenWidth(8)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlueAccent),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFC6FFDD),
                        Color(0xFFFBD786),
                      ]),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: .5,
                      spreadRadius: 1.0,
                      // color: Colors.black.withOpacity(0.12),
                    ),
                  ]),
              child: Text(
                message,
                style: TextStyle(fontSize: getProportionateScreenHeight(15)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
