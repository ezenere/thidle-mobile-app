import 'package:flutter/material.dart';
import 'package:thidle/main.dart';
import 'package:thidle/menu.dart';
import 'package:thidle/nav.dart';
import 'package:thidle/profile/profile2.dart';
import 'package:thidle/routes.dart';
import 'package:thidle/thoughts/thoughts.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  ThidleRoute currentRoute = Routes.getByKey('home');

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color.fromARGB(255, 1, 16, 25),
    drawer: const AppMenu(),
    appBar: AppBar(
      title: const Image(
        image: NetworkImage('https://thidle.com/static/assets/images/thidle24-wname.png'),
        fit: BoxFit.fitHeight,
        height: 40,
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.search_rounded),
          color: currentRoute.key == 'search' ? Thidle.defaultColor : null,
          tooltip: 'Search',
          onPressed: () => setState(() {
            currentRoute = Routes.getByKey('search');
          }),
        ),
      ],
      leading: Builder(
        builder: (BuildContext context) => IconButton(
          icon: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: const Image(
                image: NetworkImage('https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg'),
                height: 45,
                width: 45,
                alignment: Alignment.center,
              )
          ),
          onPressed: () { Scaffold.of(context).openDrawer(); },
        )
      )
    ),
    //body: //const Profile(),
    body: Thoughts(thoughts: ThoughtObject.fromJsonArray()),
    bottomNavigationBar: BottomNav(
        currentIndex: currentRoute.bottomTabIndex,
        setIndex: (int index) => setState(() {
          currentRoute = Routes.getByIndex(index);
        }
      )
    ),
  );
}