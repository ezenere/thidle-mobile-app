import 'package:flutter/material.dart';

class AppMenu extends StatefulWidget {
  const AppMenu({super.key, });

  @override
  State<AppMenu> createState() => AppMenuState();
}

class AppMenuState extends State<AppMenu> {
  @override
  Drawer build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(45),
                child: const Image(
                  image: NetworkImage('https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg'),
                  height: 45,
                  width: 45,
                  alignment: Alignment.center,
                )
              ),
              Expanded(
                child: Column(
                  children: const <Widget>[
                    Text('Eduardo Zenere de Oliveira', textAlign: TextAlign.left),
                    Text('@ezenere', textAlign: TextAlign.left),
                  ],
                )
              ),
            ],
          )
        ],
      )
    );
  }
}