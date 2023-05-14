import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:thidle/thoughts/video.dart';

class ThidleImage {
  final String url;
  final String? alt;

  ThidleImage(this.url, this.alt);

  ThidleImage.fromJson(Map<String, dynamic> json):
    url = json['url'],
    alt = json['alt'];
}

class ThidleVideo {
  final String url;
  final int width;
  final int height;

  ThidleVideo(this.url, this.width, this.height);

  ThidleVideo.fromJson(Map<String, dynamic> json):
    width = json['width'],
    height = json['height'],
    url = json['url'];
}

class ThoughtUser {
  final int id;
  final String name;
  final String username;
  final String? description;
  final ThidleImage? picture;
  final bool private;

  ThoughtUser(this.id, this.name, this.username, this.description, this.picture, this.private);

  ThoughtUser.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    username = json['username'],
    description = json['description'],
    picture = json['picture'] != null ? ThidleImage.fromJson(json['picture']) : null,
    private = json['private'];
}

class ThoughtPrivacy {
  final String main;
  final String comment;

  ThoughtPrivacy(this.main, this.comment);

  ThoughtPrivacy.fromJson(Map<String, dynamic> json):
    main = json['main'],
    comment = json['comment'];
}

class ThoughtCount {
  final int like;
  final int comments;
  final int rethoughts;
  final int shares;

  ThoughtCount(this.like, this.comments, this.rethoughts, this.shares);

  ThoughtCount.fromJson(Map<String, dynamic> json):
    like = json['like'],
    comments = json['comment'],
    rethoughts = json['rethought'],
    shares = json['share'];
}

class ThoughtUserInteraction {
  final bool like;
  final bool comment;
  final bool rethought;
  final int currentUser;
  final int id;

  ThoughtUserInteraction(this.like, this.comment, this.rethought, this.currentUser, this.id);

  ThoughtUserInteraction.fromJson(Map<String, dynamic> json):
    like = json['like'],
    comment = json['comment'],
    rethought = json['rethought'],
    currentUser = json['currentUser'],
    id = json['id'];
}

class ThoughtObject {
  final int id;
  final ThoughtUser by;
  final List<ThidleImage>? images;
  final List<ThidleVideo>? videos;
  // 'poll', GetThoughtPoll(ThoughtInfo->'$.id', CurrentUser),
  final String? text;
  final DateTime? date;
  final ThoughtPrivacy privacy;
  final ThoughtCount count;
  final ThoughtUserInteraction user;
  final ThoughtObject? embed;
  final ThoughtObject? parent;
  final List<ThoughtObject> comments;
  final bool rethought;
  final bool followed;
  final bool edited;

  ThoughtObject(
    this.id,
    this.by,
    this.images,
    this.videos,
    this.text,
    this.date,
    this.privacy,
    this.count,
    this.user,
    this.embed,
    this.parent,
    this.comments,
    this.rethought,
    this.followed,
    this.edited
  );

  ThoughtObject.fromJson(Map<String, dynamic> json):
    id = json['id'],
    by = ThoughtUser.fromJson(json['by']),
    images = json['images'] != null ? List.from(List.from(json['images']).map((i) => ThidleImage.fromJson(i))) : null,
    videos = json['videos'] != null ? List.from(List.from(json['videos']).map((i) => ThidleVideo.fromJson(i))) : null,
    text = json['text'],
    date = DateTime.tryParse(json['date']),
    privacy = ThoughtPrivacy.fromJson(json['privacy']),
    count = ThoughtCount.fromJson(json['count']),
    user =  ThoughtUserInteraction.fromJson(json['user']),
    embed = json['embed'] != null ? ThoughtObject.fromJson(json['embed']) : null,
    parent = json['parent'] != null ? ThoughtObject.fromJson(json['parent']) : null,
    comments = List.from(List.from(json['comments']).map((i) => ThidleImage.fromJson(i))),
    rethought = json['rethought'],
    followed = json['followed'],
    edited = json['edited'];

  static List<ThoughtObject> fromJsonArray(){
    String data = '[{"by":{"id":1,"name":"Eduardo Zenere","picture":{"alt":"Profile","url":"https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg"},"private":false,"username":"ezenere","description":null},"id":4060087,"date":"2023-01-30 04:13:48.000000","poll":null,"text":"Será meu fundo de perfil em breve...","user":{"id":4060087,"like":true,"comment":false,"rethought":false,"currentUser":1},"count":{"like":347,"share":0,"comment":0,"rethought":0},"edited":false,"embeed":null,"images":[{"alt":"Thought Image","url":"https://media.thidle.com/storage/image/20230130041348/jxyKpFJ1Kjk5sM3RYDmeZkzmlgReuO8CnpM4EkcFpPOZ77EBiwkcb9SW9nK1uId9d0zvQNWGGtVOh2hW5smo75GWfEV0MbGZ4BXzjuH3lRzBkufCLgFbjci9OPTMke2f5vedC3jjBf5YWaO2fGx8yryONveVFpUp5geHmGm4tFvzNObneYYN7Y9nzATmNsLlOXavMMcExEJkXPhoh5SQ7CL33cd66e588c73b35236d85c5ce96aaa9aa75b389/67134_2560x1706.jpg"}, {"alt":"Thought Image","url":"https://media.thidle.com/storage/image/20230130041348/jxyKpFJ1Kjk5sM3RYDmeZkzmlgReuO8CnpM4EkcFpPOZ77EBiwkcb9SW9nK1uId9d0zvQNWGGtVOh2hW5smo75GWfEV0MbGZ4BXzjuH3lRzBkufCLgFbjci9OPTMke2f5vedC3jjBf5YWaO2fGx8yryONveVFpUp5geHmGm4tFvzNObneYYN7Y9nzATmNsLlOXavMMcExEJkXPhoh5SQ7CL33cd66e588c73b35236d85c5ce96aaa9aa75b389/67134_2560x1706.jpg"}, {"alt":"Thought Image","url":"https://media.thidle.com/storage/image/20230130041348/jxyKpFJ1Kjk5sM3RYDmeZkzmlgReuO8CnpM4EkcFpPOZ77EBiwkcb9SW9nK1uId9d0zvQNWGGtVOh2hW5smo75GWfEV0MbGZ4BXzjuH3lRzBkufCLgFbjci9OPTMke2f5vedC3jjBf5YWaO2fGx8yryONveVFpUp5geHmGm4tFvzNObneYYN7Y9nzATmNsLlOXavMMcExEJkXPhoh5SQ7CL33cd66e588c73b35236d85c5ce96aaa9aa75b389/67134_2560x1706.jpg"}],"parent":null,"videos":null,"privacy":{"main":"P","comment":"P"},"comments":[],"followed":false,"rethought":false},{"by":{"id":1,"name":"Eduardo Zenere","picture":{"alt":"Profile","url":"https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg"},"private":false,"username":"ezenere","description":null},"id":4060086,"date":"2023-01-30 04:08:45.000000","poll":null,"text":"Nossa, sério, valeu a pena todos os meses de estudo e projeto pra fazer isso, muito foda\\n\\n\\nGostei do resultado até agora kkkk","user":{"id":4060086,"like":false,"comment":false,"rethought":false,"currentUser":1},"count":{"like":0,"share":0,"comment":0,"rethought":0},"edited":false,"embeed":null,"images":null,"parent":null,"videos":null,"privacy":{"main":"P","comment":"P"},"comments":[],"followed":false,"rethought":false},{"by":{"id":1,"name":"Eduardo Zenere","picture":{"alt":"Profile","url":"https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg"},"private":false,"username":"ezenere","description":null},"id":4060085,"date":"2023-01-30 04:07:13.000000","poll":null,"text":"Ah é","user":{"id":4060085,"like":false,"comment":false,"rethought":false,"currentUser":1},"count":{"like":0,"share":0,"comment":0,"rethought":0},"edited":false,"embeed":null,"images":null,"parent":null,"videos":[{"url":"https://media.thidle.com/storage/video/20230130040713/OYtFQmP6p3bLHH2ec4CWm8st3oVxjoUiF9LSLRJyLD6uTFDusWd48kV2Cug7vhBGhyNPUwETiUSEaJvX44VUjVA1PauLSFxNWMme6fVhQzUA84kc35xw6P9XkIHTkfk17HUmFEkbYUDEKFW18cNED2pRcxu44S0u3ifOq74WvUdnnKztkWCc8mTct19ptApaJrGCivyhqHDRm4fnJoTBzgB68f4f4c82a25ef3924565988a7ebe0d3ccc18c58/b7ev3p7kuRe1afa90aedf5a5d8f475e6253fa50d173e7bc57c.m3u8","width":1920,"height":1080}],"privacy":{"main":"P","comment":"P"},"comments":[],"followed":false,"rethought":false},{"by":{"id":1,"name":"Eduardo Zenere","picture":{"alt":"Profile","url":"https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg"},"private":false,"username":"ezenere","description":null},"id":4060084,"date":"2023-01-30 04:00:20.000000","poll":null,"text":"Isso é loucura mano...","user":{"id":4060084,"like":false,"comment":false,"rethought":false,"currentUser":1},"count":{"like":0,"share":0,"comment":0,"rethought":0},"edited":false,"embeed":null,"images":null,"parent":null,"videos":[{"url":"https://media.thidle.com/storage/video/20230130035826/BlyGA51r1iG1k5VhGSiFnhvB1mMdmyW6K0QPsvanwnEew7zpSwvKxYyU5LoRYnFBXiy9nEuWLo67nMaG7Kh2FaoH0YLwFS5uiE4Ywv7l9WH0DYb8Wq2YUIlDf4FgLSy7dUje0QMxCtxdITPs5djPA1NV1oBy1Yz3gAXJbDTArFo0c3jAiI9veiP7szxaCRPXp8wqW7bqk98TEUCsDMqnCDf89788b5be7411037814fb27623ccd8685c67c204/5TiYKpcjHG4b9319214f62e5ec28812966e1a511e5381977ba.m3u8","width":1920,"height":1080}],"privacy":{"main":"P","comment":"P"},"comments":[],"followed":false,"rethought":false},{"by":{"id":1,"name":"Eduardo Zenere","picture":{"alt":"Profile","url":"https://media.thidle.com/storage/image/20230130023344/cI7eXvqPUoJ4g9hyOYNPviAJqAk785ZG1emYR4G1cSuHibPV0Pw340CtJtBWezLZewZxgi2iltQDPOIkWLrk5HNYq3NDlfdqo8M8UpjLApa18XThMVW8ItiVTAHjk9tySUmsCnoPiTf2ZCn3qKKAM6HH4NdbTtQ0GZ5ylXYitzTfWrnNJTerSfZi5UvJc8398m2QINbDYCKV9Kf3u6UOt2wed088cda80b0f59f923a54b601533d68ee8cd394/66131_450x450.jpg"},"private":false,"username":"ezenere","description":null},"id":4060083,"date":"2023-01-30 02:40:45.000000","poll":null,"text":"Ver um projeto gigante funcionando é muito gratificante slc","user":{"id":4060083,"like":false,"comment":false,"rethought":false,"currentUser":1},"count":{"like":0,"share":0,"comment":0,"rethought":0},"edited":false,"embeed":null,"images":null,"parent":null,"videos":null,"privacy":{"main":"P","comment":"P"},"comments":[],"followed":false,"rethought":false}]';
    return List.from(List.from(jsonDecode(data).map((i) => ThoughtObject.fromJson(i))));
  }
}

class Thoughts extends StatefulWidget {
  final List<ThoughtObject> thoughts;
  final bool asColumn;

  const Thoughts({super.key, required this.thoughts, this.asColumn = false});

  @override
  State<Thoughts> createState() => ThoughtsState();
}

class ThoughtsState extends State<Thoughts> {
  @override
  Widget build(BuildContext context) {
    List<Thought?> items = List.filled(widget.thoughts.length, null);
    for(int c = 0; c < widget.thoughts.length; c++){
      items[c] = Thought(info: widget.thoughts[c], key: Key(widget.thoughts[c].id.toString()));
    }

    return widget.asColumn ?
      Column(children: List.from(items)) :
      ListView(
        padding: const EdgeInsets.all(15),
        children: List.from(items),
      );
  }
}

class Thought extends StatefulWidget {
  final ThoughtObject info;
  const Thought({super.key, required this.info});

  static String readDate(DateTime date) {
    const List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${months[date.month]} ${date.day}, ${date.year} at ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  static String readCountValue(int count){
    if(count < 1000) return count.toString();
    if(count < 100000) {
      int cent = ((count % 1000) / 100).floor();
      return '${(count / 1000).floor()}${cent > 0 ? '.$cent' : ''}K';
    }
    if(count < 1000000) {
      return '${(count / 1000).floor()}K';
    }
    if(count < 100000000){
      int cent = ((count % 1000000) / 100000).floor();
      return '${(count / 1000000).floor()}${cent > 0 ? '.$cent' : ''}M';
    }
    if(count < 1000000000) {
      return '${(count / 1000000).floor()}M';
    }
    int cent = ((count % 1000000000) / 100000000).floor();
    return '${(count / 1000000000).floor()}${cent > 0 ? '.$cent' : ''}B';
  }

  static String getPrivacyDescription(String privacy) {
    switch(privacy){
      case 'P':
        return 'Public';
      case 'F':
        return 'Friends';
      case 'S':
        return 'Selected People';
      case 'A':
        return 'Anonymous';
    }
    return 'Unknown';
  }

  @override
  State<Thought> createState() => ThoughtState();
}

class ThoughtState extends State<Thought> {
  @override
  Widget build(BuildContext context) {
    List<Widget> mediaGallery = [];
    if((widget.info.images?.length ?? 0) > 0) {
      mediaGallery.add(
        Builder(
          builder: (BuildContext ctx) {
            int selectedIndex = 0;
            return DefaultTabController(
              length: (widget.info.images?.length ?? 0),
              child: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                    TabController tabController = DefaultTabController.of(context);
                    tabController.addListener(() => {
                      setState(() {
                        selectedIndex = tabController.index;
                      })
                    });
                    return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                                height: 250,
                                child: TabBarView(
                                  children: List.from(
                                      widget.info.images!.map((i) => ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(i.url),
                                            alignment: Alignment.center,
                                          )
                                      ))
                                  ),
                                )
                            ),
                          ),
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,mainAxisSize: MainAxisSize.min,
                              children: List.from(
                                  List.generate(widget.info.images!.length, (index) => index).map((i) => Padding(
                                      padding: const EdgeInsets.fromLTRB(5, 5, 5 ,0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: selectedIndex == i ? const Color.fromARGB(255, 197, 90, 17) : const Color.fromARGB(255, 128, 136, 140)
                                          ),
                                          height: 5,
                                          width: 5
                                      )
                                  ))
                              )
                          )
                        ]
                    );
                  }
              ),
            );
          }
        )
      );
    }

    if((widget.info.videos?.length ?? 0) > 0) {
      mediaGallery.add(ThidleVideoWidget(video: widget.info.videos![0]));
    }

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Column(
            children: [
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(45),
                          child: Image(
                            image: NetworkImage(widget.info.by.picture?.url ?? ''),
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                          )
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 5),
                            child: Row(
                                children: <Widget>[
                                  GestureDetector(
                                    // onTap: (),
                                    child: Text(
                                      widget.info.by.name,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.2,
                                          overflow: TextOverflow.ellipsis
                                      )
                                    )
                                  ),
                                  Text(
                                    '  -  @${widget.info.by.username}',
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                        color: Color.fromARGB(51, 255, 255, 255),
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13
                                    ),
                                  ),
                                ]
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(
                              '${Thought.getPrivacyDescription(widget.info.privacy.main)}  \u2022  ${widget.info.date != null ? Thought.readDate(widget.info.date!) : 'Date not available'}',
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                  color: Color.fromARGB(64, 255, 255, 255),
                                  fontSize: 10.5,
                                  fontFamily: 'Roboto'
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 3, 0, 0),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: Color.fromARGB(255, 34, 48, 62),
                              style: BorderStyle.solid,
                              width: 1
                            )
                          )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.info.text ?? '',
                                style: const TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Color.fromARGB(230, 255, 255, 255),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                                ),
                              ),
                              ...mediaGallery,
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.favorite_rounded),
                                            color: widget.info.user.like ? Colors.red : Colors.grey,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            splashRadius: 18,
                                            splashColor: const Color.fromARGB(120, 255, 0, 0),
                                            highlightColor: const Color.fromARGB(50, 255, 255, 255),
                                            iconSize: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                            child: Text(Thought.readCountValue(widget.info.count.like), style: TextStyle(color: widget.info.user.like ? Colors.red : Colors.grey, fontSize: 12))
                                          )
                                        ],
                                      )
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.repeat_rounded),
                                            color: widget.info.user.rethought ? Colors.green : Colors.grey,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            splashRadius: 18,
                                            splashColor: const Color.fromARGB(75, 0, 255, 50),
                                            highlightColor: const Color.fromARGB(50, 255, 255, 255),
                                            iconSize: 20,
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                              child: Text(Thought.readCountValue(widget.info.count.rethoughts), style: TextStyle(color: widget.info.user.rethought ? Colors.green : Colors.grey, fontSize: 12))
                                          )
                                        ],
                                      )
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.comment_rounded),
                                            color: widget.info.user.comment ? Colors.blue : Colors.grey,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(),
                                            splashRadius: 18,
                                            splashColor: const Color.fromARGB(140, 0, 120, 255),
                                            highlightColor: const Color.fromARGB(50, 255, 255, 255),
                                            iconSize: 20,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(7, 0, 0, 0),
                                            child: Text(Thought.readCountValue(widget.info.count.comments), style: TextStyle(color: widget.info.user.comment ? Colors.blue : Colors.grey, fontSize: 12))
                                          )
                                        ],
                                      )
                                    ),
                                    Container(
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.share_rounded),
                                        color: Colors.grey,
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(),
                                        splashRadius: 20,
                                        splashColor: const Color.fromARGB(100, 255, 255, 255),
                                        highlightColor: const Color.fromARGB(50, 255, 255, 255),
                                        iconSize: 20,
                                      ),
                                      width: 100,
                                      alignment: Alignment.centerRight,
                                    ),
                                  ],
                                )
                              )
                            ],
                          )
                        )
                      )
                    )
                  ]
                )
              ),
            ],
          ),
        ),
        const Divider(color: Color.fromARGB(255, 34, 48, 62), height: 35, thickness: 1)
      ],
    );
  }
}