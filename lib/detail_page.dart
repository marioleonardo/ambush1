import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DetailPage extends StatelessWidget {
  final int index;

  DetailPage({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFDDE0D6),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Detail Page', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'item$index',
              flightShuttleBuilder: (flightContext, animation, direction,
                  fromContext, toContext) {
                return AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: fromContext.widget,
                    );
                  },
                );
              },
              transitionOnUserGestures: true,
              child: ClipRect(
                child: Image.asset(
                  'assets/img2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Item $index',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$99.99',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This is a detailed description of item $index. It includes all the features and benefits of the product.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        // Add to cart action
                      },
                      icon: Icon(Icons.add_shopping_cart),
                      label: Text('Add to Cart'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: Size(250, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  VideoPlayer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffDDE0D6),
      ),
      margin: EdgeInsets.only(top: 26),
      width: double.infinity,
      height: 200,
      child: RotatedBox(
          quarterTurns: 1,
          child: LoopVideoPlayer(
            assetPath: 'assets/video.mp4',
          )),
    );
  }
}

class LoopVideoPlayer extends StatefulWidget {
  final String assetPath;

  const LoopVideoPlayer({required this.assetPath});

  @override
  _LoopVideoPlayerState createState() => _LoopVideoPlayerState();
}

class _LoopVideoPlayerState extends State<LoopVideoPlayer> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath);
    _chewieController = ChewieController(
      videoPlayerController: _controller,
      looping: true,
      autoInitialize: true,
      autoPlay: true,
      showControls: false, // Remove controls for the user
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }
}
