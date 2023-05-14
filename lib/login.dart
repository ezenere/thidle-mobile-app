import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thidle/components/buttons.dart';
import 'package:thidle/main.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarBrightness: Brightness.light)
    );

    return Scaffold(
    backgroundColor: const Color.fromARGB(255, 1, 16, 25),
    body: Stack(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(
              image: AssetImage('assets/login-bg.jpg'),
              height: 400,
              fit: BoxFit.fitHeight,
            ),
            Container(
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(255, 1, 16, 25)
                  ]
                )
              )
            )
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 75, 0, 75),
              alignment: Alignment.center,
              child: Image(
                width: MediaQuery.of(context).size.width / 1.75,
                image: NetworkImage('https://thidle.com/static/assets/images/thidle24-wname.png'),
              ),
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 7),
                        child: Text(
                            'New to the app?',
                            style: TextStyle(
                              color: Color.fromARGB(150, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            )
                        ),
                      ),
                      AppButton(
                        text: 'Create Account',
                        color: Colors.white,
                        background: Thidle.defaultColor,
                        callback: () {
                          Navigator.pushNamed(context, '/login/signup');
                        },
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40, bottom: 7),
                        child: Text(
                            'but if you are already registered',
                            style: TextStyle(
                              color: Color.fromARGB(150, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.w200,
                            )
                        ),
                      ),
                      AppButton(
                        text: 'Sign In',
                        color: Colors.white,
                        callback: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ]
                )
            ),
            Container(
              alignment: Alignment(0, 1),
              padding: EdgeInsets.only(bottom: 75, top : 120),
              child: Text(
                  'Copyright © Thidle 2023, All rights reserved',
                  style: TextStyle(
                    color: Color.fromARGB(75, 255, 255, 255),
                    fontSize: 11,
                    fontWeight: FontWeight.w200,
                  )
              ),
            )
          ],
        ),
      ],
    )
  );
  }
}