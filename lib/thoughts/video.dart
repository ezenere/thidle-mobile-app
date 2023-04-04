import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:thidle/thoughts/thoughts.dart';
import 'package:video_player/video_player.dart';

class ThidleVideoWidget extends StatefulWidget {
  final ThidleVideo video;
  const ThidleVideoWidget({super.key, required this.video});

  @override
  State<ThidleVideoWidget> createState() => ThidleVideoWidgetState();
}

class ThidleVideoWidgetState extends State<ThidleVideoWidget> {
  VideoPlayerController? videoPlayer;
  ChewieController? controller;

  Duration currentVideoSeconds = const Duration();
  Duration videoDuration = const Duration();
  bool playingVideo = false;

  @override
  void dispose(){
    videoPlayer!.dispose();
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    videoPlayer = VideoPlayerController.network(widget.video.url);
    videoPlayer!.setVolume(1);
    controller = ChewieController(
      videoPlayerController: videoPlayer!,
      autoPlay: false,
      looping: true,
      autoInitialize: true,
      customControls: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          videoPlayer!.addListener(() {
            if(
              currentVideoSeconds.inMilliseconds != videoPlayer!.value.position.inMilliseconds ||
              videoDuration.inMilliseconds != videoPlayer!.value.duration.inMilliseconds ||
              videoPlayer!.value.isPlaying != playingVideo
            ){
              setState(() {
                videoDuration = videoPlayer!.value.duration;
                currentVideoSeconds = videoPlayer!.value.position;
                playingVideo = videoPlayer!.value.isPlaying;
              });
            }
          });

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                alignment: Alignment.bottomLeft,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Color.fromARGB(175, 0, 0, 0),
                        Color.fromARGB(150, 0, 0, 0),
                        Color.fromARGB(125, 0, 0, 0),
                        Color.fromARGB(75, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ]
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                        alignment: Alignment.topLeft,
                        child:  ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: SizedBox(
                          height: 3,
                          child: VideoProgressIndicator(
                            videoPlayer!,
                            allowScrubbing: true,
                            padding: EdgeInsets.zero,
                            colors: const VideoProgressColors(
                              playedColor: Colors.white,
                              backgroundColor: Color.fromARGB(10, 255, 255, 255),
                              bufferedColor: Color.fromARGB(75, 255, 255, 255),
                            ),
                          )
                        )
                      )
                    ),
                    Row(children: [
                      GestureDetector(
                        child: Icon(playingVideo ? Icons.pause_rounded : Icons.play_arrow_rounded, color: Colors.white),
                        onTap: () {
                          setState(() {
                            if(playingVideo) { videoPlayer!.pause(); }
                            else { videoPlayer!.play(); }
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Text('${(currentVideoSeconds.inSeconds/60).floor().toString().padLeft(2, '0')}:${(currentVideoSeconds.inSeconds%60).toString().padLeft(2, '0')} - ${(videoDuration.inSeconds/60).floor().toString().padLeft(2, '0')}:${(videoDuration.inSeconds%60).toString().padLeft(2, '0')}', style: const TextStyle(color: Colors.white))
                      )
                    ])
                  ],
                ),
              )
            ],
          );
        }
      ),
      aspectRatio: widget.video.width/widget.video.height,
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          height: ((MediaQuery.of(context).size.width-75)/widget.video.width * widget.video.height),
          child: Chewie(
            controller: controller!
          )
        )
      )
    );
  }
}