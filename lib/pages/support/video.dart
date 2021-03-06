import 'package:chewie/chewie.dart';
// import 'package:chewie/src/chewie_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoAppPage extends StatefulWidget {
  _VideoAppState createState() => new _VideoAppState();
}

class _VideoAppState extends State<VideoAppPage> {
    // TargetPlatform _platform;
    VideoPlayerController _videoPlayerController1;
    VideoPlayerController _videoPlayerController2;
    ChewieController _chewieController;

    @override
    void initState() {
      super.initState();
      _videoPlayerController1 = VideoPlayerController.network(
          'https://www.runoob.com/try/demo_source/mov_bbb.mp4');
      _videoPlayerController2 = VideoPlayerController.network(
          'https://www.runoob.com/try/demo_source/mov_bbb.mp4');
      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController1,
        aspectRatio: 3 / 2,
        autoPlay: true,
        looping: true,
        // Try playing around with some of these other options:

        // showControls: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.blue,
          backgroundColor: Color.fromRGBO(0, 0, 0, .2),
          bufferedColor: Colors.lightGreen,
        ),
        placeholder: Container(
          color: Color.fromRGBO(0, 0, 0, .2),
        ),
        autoInitialize: true,
      );
    }

    @override
    void dispose() {
      _videoPlayerController1.dispose();
      _videoPlayerController2.dispose();
      _chewieController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
        return new Center(
            child: Column(
              children: [
                Chewie(
                  controller: _chewieController,
                ),
                SizedBox(height: 30),
                FlatButton(
                  onPressed: () {
                    _chewieController.enterFullScreen();
                  },
                  child: Text('Fullscreen'),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _chewieController.dispose();
                            _videoPlayerController2.pause();
                            _videoPlayerController2.seekTo(Duration(seconds: 0));
                            _chewieController = ChewieController(
                              videoPlayerController: _videoPlayerController1,
                              aspectRatio: 3 / 2,
                              autoPlay: true,
                              looping: true,
                            );
                          });
                        },
                        child: Padding(
                          child: Text("Video 1"),
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                        ),
                      ),
                    ),
                    Expanded(
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            _chewieController.dispose();
                            _videoPlayerController1.pause();
                            _videoPlayerController1.seekTo(Duration(seconds: 0));
                            _chewieController = ChewieController(
                              videoPlayerController: _videoPlayerController2,
                              aspectRatio: 3 / 2,
                              autoPlay: true,
                              looping: true,
                            );
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Text("Error Video"),
                        ),
                      ),
                    )
                  ],
                ),
                // Row(
                //   children: <Widget>[
                //     Expanded(
                //       child: FlatButton(
                //         onPressed: () {
                //           setState(() {
                //             _platform = TargetPlatform.android;
                //           });
                //         },
                //         child: Padding(
                //           child: Text("Android controls"),
                //           padding: EdgeInsets.symmetric(vertical: 16.0),
                //         ),
                //       ),
                //     ),
                //     Expanded(
                //       child: FlatButton(
                //         onPressed: () {
                //           setState(() {
                //             _platform = TargetPlatform.iOS;
                //           });
                //         },
                //         child: Padding(
                //           padding: EdgeInsets.symmetric(vertical: 16.0),
                //           child: Text("iOS controls"),
                //         ),
                //       ),
                //     )
                //   ],
                // )
              ]
            )
        );
    }
}