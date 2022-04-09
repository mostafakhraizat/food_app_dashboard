import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'dashboard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int index = 0;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    bool page1 = index == 0;
    bool page2 = index == 1;
    bool page3 = index == 2;

    final Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            appBar: null,
            body: Stack(children: [
              Positioned(
                child: Container(
                  child: page1
                      ? const DashBoard()
                      : page2
                          ? const Center(child: Text('page2'),)
                          : page3
                              ? const Text("page3")
                      : const Center(child: Text('page2'),),
                  width: size.width,
                  height: size.height,
                  color: Colors.white,
                ),
                top: 0,
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: SizedBox(
                      width: size.width,
                      height: 80,
                      child: Stack(clipBehavior: Clip.none, children: [
                        CustomPaint(
                          size: Size(size.width, 80),
                          painter: BNBCustomPainter(),
                        ),
                        Center(
                          heightFactor: 0.6,
                          child: FloatingActionButton(
                              backgroundColor: const Color(0xfff54748),
                              child: const Icon(
                                IconlyBold.scan,
                              ),
                              elevation: 0.1,
                              onPressed: () {
                              }),
                        ),
                        SizedBox(
                            width: size.width,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.home,
                                      color: index == 0
                                          ? const Color(0xfff54748)
                                          : Colors.grey.shade400,
                                    ),
                                    onPressed: () {
                                      setBottomBarIndex(0);
                                    },
                                    splashColor: Colors.white,
                                  ),
                                  IconButton(
                                      icon: Icon(
                                        Icons.restaurant_menu,
                                        color: index == 1
                                            ? const Color(0xfff54748)
                                            : Colors.grey.shade400,
                                      ),
                                      onPressed: () {
                                        setBottomBarIndex(1);
                                      }),
                                  Container(
                                    width: size.width * 0.20,
                                  ),
                                  IconButton(
                                      icon: Badge(
                                        badgeContent: const Text(
                                          "3",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        child: Icon(
                                          IconlyBold.notification,
                                          color: index == 2
                                              ? const Color(0xfff54748)
                                              : Colors.grey.shade400,
                                        ),
                                      ),
                                      onPressed: () {
                                        setBottomBarIndex(2);
                                      }),
                                  IconButton(
                                      icon: Icon(
                                        Icons.person,
                                        color: index == 3
                                            ? const Color(0xfff54748)
                                            : Colors.grey.shade400,
                                      ),
                                      onPressed: () {

                                      }),
                                ]))
                      ])))
            ])));
  }

  setBottomBarIndex(index1) {
    setState(() {
      index = index1;
    });
  }

}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
