import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width/2.68 + 60,
          child: Stack(
            children: [
              Stack(
                children: [
                  const Image(
                    image: NetworkImage('https://media.thidle.com/storage/image/20230203174952/OGRdKFtO1GrWt2LGhm4jrO8VF6wJLi5Ph7eQ5JK79F2zJ8nMpbqLsnAOc0YYcrR7YQHHk7yG9B9HQ1IymrBPwcZC2hJjoGg1eSfTz0pSywOx0SOUy557o0M52cJlr0Q2yyS2jzPykRDnZxbAKKo2iINvsrwUgiKSDM1t1UH82Vi55kiGB5x0oo08gmOhlCSveWkmGwD7vxCGvqfIsw4fRz150177ed515f9356326b6b77c7182f4f0e8bd9805/86161_1600x593.jpg'),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255, 1, 16, 25),
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Colors.transparent,
                          Color.fromARGB(120, 1, 16, 25),
                          Color.fromARGB(200, 1, 16, 25),
                          Color.fromARGB(255, 1, 16, 25)
                        ]
                      )
                    ),
                    height: MediaQuery.of(context).size.width/2.68,
                  )
                ]
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: const Image(
                          image: NetworkImage('https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg'),
                          height: 100,
                          width: 100,
                        )
                      ),
                  ),

                ],
              )
            ]
          )
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                  "Eduardo Zenere",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w600,
                      fontSize: 19,
                      overflow: TextOverflow.ellipsis
                  )
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
              child: Text(
                '@ezenere',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromARGB(51, 255, 255, 255),
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                    fontSize: 17
                ),
              ),
            )
          ],
        )
      ]
    );
  }
}