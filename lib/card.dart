import 'package:flutter/material.dart';

class GradientCard extends StatefulWidget {
  const GradientCard(
      {Key? key,
      this.colorBegin,
      this.colorCenter,
      this.colorEnd,
      this.title,
      this.subtitle,
      this.topIcon,
      this.bottomIcon,
      this.textStyle})
      : super(key: key);
  final Color? colorBegin;
  final Color? colorCenter;
  final Color? colorEnd;
  final Text? title;
  final Text? subtitle;
  final Widget? topIcon;
  final Widget? bottomIcon;
  final TextStyle? textStyle;

  @override
  _GradientCardState createState() => _GradientCardState();
}

class _GradientCardState extends State<GradientCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Center(
            child: Stack(alignment: Alignment.center, children: <Widget>[

          Positioned(
            top: 0,
            bottom: 30,
            child: Container(
              width: MediaQuery.of(context).size.width - 50,
              decoration:  const BoxDecoration(
                  gradient: LinearGradient(
                      begin:Alignment(-1, -1),
                      end:Alignment(0, -2),
                      colors: [
                        Color(0xfffde7e7),
                        Color(0xfffde7e7),
                      ]),
                  borderRadius:BorderRadius.all(Radius.circular(34))),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                                child: widget.title == null
                                    ?Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const  Text(
                                            "Recommended",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color:
                                                 Color(0xff462C1B)),
                                          ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: const[
                                             Text(
                                                "Products, ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color:  Color(0xff462C1B),)

                                              ),
                                              Text(
                                                "Explore!",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color:  Color(0xfff54748),)
                                              ),
                                           ],
                                         ),
                                      ],
                                    )
                                    : widget.title!),

                            const SizedBox(
                              width: 24,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:const [
                             SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const  SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Visit",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: const Color(0xfff54748),
                                  borderRadius: BorderRadius.circular(20)),
                            )
                          ]
                        )
                      ),const SizedBox(
                        width: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 32,top: 0),
                        child: Image.asset('assets/images/item.png',height: 100,width: 0100,),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ])));
  }
}


