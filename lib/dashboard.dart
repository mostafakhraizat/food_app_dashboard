import 'dart:async';
import 'dart:math';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:food_app_dashboard/card2.dart';
import 'package:food_app_dashboard/colors.dart';

import 'package:iconly/iconly.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'card.dart';
import 'item.dart';
import 'package:fl_chart/fl_chart.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<String> items = ['initial one', 'initial two'];
  Color barBackgroundColor = const Color(0xffc0c0c0);
  Duration animDuration = const Duration(milliseconds: 250);
  List<String> names = [
    'Nutella',
    'HotDog',
    'Peperoni',
    'Pasta',
    'Pizza',
    'Milk',
    'Nescafe',
    'Water'
  ];

  int touchedIndex = -1;
  bool isPlaying = false;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer t) {
      addItem();
      removeItem();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SizedBox(
              width: size.width,
              height: 240,
              child: Swiper(
                indicatorLayout: PageIndicatorLayout.WARM,
                itemBuilder: (context, index) {
                  return GradientCard(
                    textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
                    colorCenter: Colors.blue,
                  );
                },
                autoplay: false,
                itemCount: 1,
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                scrollDirection: Axis.horizontal,
                loop: false,
                duration: 300,
                pagination: SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                      color: Colors.grey[300],
                      activeColor: const Color(0xfff54748)),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    removeItem();
                    addItem();
                  },
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              IconlyLight.scan,
                              color: Colors.white,
                            ),
                            Text(
                              " Scan History",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          color: const Color(0xfff54748),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(
                            IconlyBroken.heart,
                            color: Color(0xfff54748),
                          ),
                          Text(
                            "    Favorites",
                            style: TextStyle(color: Color(0xfff54748)),
                          )
                        ]),
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xfff54748).withOpacity(0.17),
                        borderRadius: BorderRadius.circular(8)),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Live Scans',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                SpinKitPulse(color: Color(0xfff54748), size: 16),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
              width: size.width,
              height: 230,
              child: AnimatedList(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                key: _listKey,
                initialItemCount: items.length,
                itemBuilder: (BuildContext context, int index,
                    Animation<double> animation) {
                  return ListItemWidget(
                    animation: animation,
                    onClick: () {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(items[index])));
                    },
                    item: items[index],
                  );
                },
              ),
            ),
            SizedBox(
              width: size.width- 40,
              height: 200,
              child: AspectRatio(
                aspectRatio: 1,
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18)),
                  color: const Color(0xffffffff),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            const Text(
                              'Activity',
                              style: TextStyle(
                                  color:  Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 14,
                            ),

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0),
                                child: BarChart(
                                  mainBarData(),
                                  swapAnimationDuration: animDuration,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: !isPlaying
                                ? const Icon(
                              Icons.refresh,
                              color: Colors.grey,
                            )
                                : JumpingDotsProgressIndicator(
                              fontSize: 22,
                            ),
                            onPressed: () {
                              setState(() {
                                isPlaying = !isPlaying;
                                if (isPlaying) {}
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  removeItem() {
    if (_listKey.currentState != null) {
      _listKey.currentState!.removeItem(
          items.length - 1,
          (context, animation) => ListItemWidget(
                animation: animation,
                item: items.elementAt(items.length - 1),
                onClick: () {},
                icon: Icons.person,
              ),
          duration: const Duration(milliseconds: 500));
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          items.length--;
        });
      });
    }
  }

  addItem() {
    int newIndex = 0;
    final item = names.elementAt(Random().nextInt(8));
    items.insert(newIndex, item);
    if (_listKey.currentState != null) {
      _listKey.currentState!
          .insertItem(newIndex, duration: const Duration(milliseconds: 500));
    }
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.redAccent,
        double width = 12,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderRadius: BorderRadius.circular(12),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(5, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 5, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 5, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 9, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.red,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;

                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              );
            }),

      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          margin: 16,
          getTitles: (double value) {
            switch (value.toInt()) {
              case 0:
                return 'M';
              case 1:
                return 'T';
              case 2:
                return 'W';
              case 3:
                return 'T';
              case 4:
                return 'F';
              default:
                return '';
            }
          },
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }
}
