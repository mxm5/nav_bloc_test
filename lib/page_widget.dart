import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({
    Key key,
    @required this.title,
    @required this.color,
  }) : super(key: key);

  final Color color;
  final String title;

  String get titles {
    return title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: color.withOpacity(0.3),
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
              radius: 150,
              backgroundColor: color.withRed(100).withOpacity(0.5),
              child: Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            ),
          ),
          Center(
            child: CircleAvatar(
              radius: 170,
              backgroundColor: color.withRed(100).withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
