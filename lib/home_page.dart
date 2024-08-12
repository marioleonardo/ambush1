import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonController;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 1100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _buttonController.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_buttonController.isAnimating) {
      _buttonController.stop();
    } else if (_buttonController.status == AnimationStatus.completed) {
      _buttonController.reverse();
    } else {
      _buttonController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDDE0D6),
      body: Stack(
        children: [
          // Title Animation
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              MoveEffect(begin: Offset(0.0, 501.0), end: Offset(0.0, 150.0)),
              FadeEffect(begin: 0.0, end: 1.0),
            ],
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 100.0, 30, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ZIP TIE BC1',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Monument"),
                        ),
                        Text(
                          textAlign: TextAlign.start,
                          'USD 38',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Goyah",
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 80,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 14, 14, 14),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              MoveEffect(begin: Offset(0.0, 1.0), end: Offset(0.0, -800.0))
            ],
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  children: [
                    Text(
                      'AMBUSH',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Monument"),
                    ),
                    Text(
                      'GENTLE MONSTER',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Goyah"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Image Animation
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              ScaleEffect(begin: Offset(0.7, 0.7), end: Offset(0.5, 0.5)),
              MoveEffect(
                  begin: Offset(-10.0, -101.0), end: Offset(50.0, -230.0))
            ],
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: RotatedBox(
                    quarterTurns: 1,
                    child: LoopVideoPlayer(
                      assetPath: 'assets/video.mp4',
                    )),
              ),
            ),
          ),
          // Second Image with Scaling Animation
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              ScaleEffect(begin: Offset(1.3, 1.3), end: Offset(0.3, 0.3)),
              MoveEffect(
                  begin: Offset(-30.0, 1.0), end: Offset(-140.0, -280.0)),
            ],
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 400.0),
                child: Image.asset('assets/vec1.png', width: 200, height: 200),
              ),
            ),
          ),
          // Rotated Text Animation
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              MoveEffect(begin: Offset(0.0, 1.0), end: Offset(0.0, -800.0))
            ],
            child: Align(
              alignment: Alignment.centerRight,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'ZIP TIE BC1',
                  style: TextStyle(
                      color: Color(0xff282828),
                      fontSize: 52,
                      fontWeight: FontWeight.w900,
                      fontFamily: "Monument"),
                ),
              ),
            ),
          ),
          // Button Animation
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              MoveEffect(begin: Offset(0.0, 1.0), end: Offset(0.0, -800.0))
            ],
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 700.0),
                child: GestureDetector(
                  onTap: () {
                    _toggleAnimation();
                  },
                  child: GetStarted(),
                ),
              ),
            ),
          ),
          // List Animation
          Animate(
            autoPlay: false,
            controller: _buttonController,
            effects: [
              MoveEffect(end: Offset(0.0, 1.0), begin: Offset(0.0, 800.0))
            ],
            child: BottomSheet(onClose: _toggleAnimation),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        controller: _buttonController,
      ),
    );
  }
}

class BottomSheet extends StatelessWidget {
  final VoidCallback onClose;

  const BottomSheet({
    Key? key,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.5,
      maxChildSize: 1.0,
      expand: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              // Close button
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Title',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        // Navigator.of(context).pop();
                        onClose();
                      },
                    ),
                  ],
                ),
              ),
              // Divider line
              Divider(height: 1),
              // Grid view content
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailPage(index: index),
                          ),
                        );
                      },
                      child: Hero(
                        transitionOnUserGestures: true,
                        tag: 'item$index',
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img2.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Item $index',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  final AnimationController controller;

  const BottomNavBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Animate(
      autoPlay: false,
      controller: controller,
      effects: [MoveEffect(end: Offset(0.0, 1.0), begin: Offset(0.0, 800.0))],
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 68, 68, 68),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromARGB(0, 45, 45, 246),
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
              backgroundColor: Colors.white,
            ),
          ],
          onTap: (index) {
            // Handle bottom navigation bar taps
          },
        ),
      ),
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20),
          Text(
            'Get Started',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 66, 66, 66),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              Icons.arrow_downward,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // onPressed: () {
      //   // Handle button press
      //   _toggleAnimation();
      // },
    );
  }
}
