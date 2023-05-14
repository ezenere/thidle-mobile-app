import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? callback;
  final Color? background;
  final Color color;

  const AppButton({required this.text, this.callback, this.background, required this.color});

  @override
  Widget build(BuildContext context) {
    double btnMax = MediaQuery.of(context).size.width * 0.8;
    if(btnMax > 350) btnMax = 350;

    return GestureDetector(
      onTap: callback,
        child: Container(
          padding: EdgeInsets.fromLTRB(29, 17, 29, 17),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: background ?? color),
              color: background,
          ),
          width: btnMax,
          child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add, color: color),
                Padding(
                  child: Text(
                    text,
                    style: TextStyle(
                      color: this.color,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.9,
                    )
                  ),
                  padding: EdgeInsets.fromLTRB(7, 0, 0, 0)
                )
              ]
          )
      )
    );
  }
}