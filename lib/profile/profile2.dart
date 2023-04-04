import 'package:flutter/material.dart';
import 'package:thidle/main.dart';
import 'package:thidle/thoughts/thoughts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    double tabBarItemsSize = 20;

    return DefaultTabController(
      length: 5,
      initialIndex: 0,
      child: NestedScrollView(
        controller: ScrollController(),
        headerSliverBuilder: (c, v) => [
          SliverToBoxAdapter(
            child: SizedBox(
              height: MediaQuery.of(context).size.width/2.68 + 30,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.fromLTRB(12, 0, 20, 0),
                      child: Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(55),
                          border: Border.all(
                            color: Color.fromARGB(255, 1, 16, 25),
                            width: 5,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 8),
                        alignment: Alignment.bottomRight,
                        child: Container(
                          padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            border: Border.all(color: Thidle.defaultColor)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.add, color: Thidle.defaultColor),
                              Padding(
                                child: Text(
                                  'Observe',
                                  style: TextStyle(
                                    color: Thidle.defaultColor,
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
                      )
                    )
                  ]
                )
              ]
            )
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
            child: Column(
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
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
            height: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: Stack(
                  children: [
                    Container(
                      color: Color.fromARGB(255, 14, 28, 37),
                      child: Row(
                          children: [
                            Expanded(child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromARGB(255, 3, 54, 85)))))),
                            Expanded(child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromARGB(255, 3, 54, 85)))))),
                            Expanded(child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromARGB(255, 3, 54, 85)))))),
                            Expanded(child: Container(decoration: BoxDecoration(border: Border(right: BorderSide(color: Color.fromARGB(255, 3, 54, 85)))))),
                            Expanded(child: Container()),
                          ]
                      ),
                    ),
                    TabBar(
                      dividerColor: Color.fromARGB(255, 3, 54, 85),
                      unselectedLabelColor: Color.fromARGB(191, 255, 255, 255),
                      labelColor: Thidle.defaultColor,
                      indicator: BoxDecoration(
                        color: Color.fromARGB(255, 26, 40, 48),
                      ),
                      tabs: [
                        Tab(icon: Icon(Icons.history_edu_rounded, size: tabBarItemsSize)),
                        Tab(icon: Icon(Icons.chat_rounded, size: tabBarItemsSize)),
                        Tab(icon: Icon(Icons.electric_bolt_rounded, size: tabBarItemsSize)),
                        Tab(icon: Icon(Icons.perm_media_rounded, size: tabBarItemsSize)),
                        Tab(icon: Icon(Icons.favorite_rounded, size: tabBarItemsSize)),
                      ],
                    ),
                  ]
                )
              )
            ),
        ),
        ],
        body: TabBarView(
            children: [
              Thoughts(thoughts: ThoughtObject.fromJsonArray()),
              Container(),
              Container(),
              Container(),
              Container(),
            ]
        ),
      )
    );
  }
}