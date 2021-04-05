import 'package:flutter/material.dart';


class LectureDetail extends StatelessWidget {
  final String title, content;
  final Color iconColor;
  final IconData icon;

  const LectureDetail(
      {Key key, this.title, this.content, this.iconColor, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor?.withOpacity(0.1) ?? Colors.black12,
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              )),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title + ':',
                  style: TextStyle(
                    letterSpacing: 0.5,
                    fontSize: 12,
                  )),
              SizedBox(height: 8),
              Text(content, style: TextStyle(fontSize: 15, letterSpacing: 1)),
            ],
          ),
        ],
      ),
    );
  }
}
