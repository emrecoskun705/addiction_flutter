import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class InfoBubbleWidget extends StatelessWidget {
  final String message;

  InfoBubbleWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/svg/octocat.svg'),
          Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.lightBlueAccent),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: .5,
                    spreadRadius: 1.0,
                    color: Colors.black.withOpacity(0.12),
                  ),
                ]),
            child: Text(message),
          )
        ],
      ),
    );
  }
}
