import 'package:flutter/material.dart';
class ListItemWidget extends StatefulWidget {
  const ListItemWidget(
      {Key? key,
        required this.item,
        required this.animation,
        required this.onClick,  this.icon});

  final String item;
  final  icon;
  final Animation<double> animation;
  final VoidCallback onClick;
  @override
  _ListItemWidgetState createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return SizeTransition(sizeFactor: widget.animation, child: buildItem());
  }

  Widget buildItem() {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Color(0xfff6f5f8),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Container(
              height: 40,
              width: 40,
              decoration:  BoxDecoration(
                  color: const Color(0xfff54748).withOpacity(0.1),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10))),
              child: const Center(
                  child: Icon(
                    Icons.fastfood,
                    color: Color(0xfff54748),
                    size: 22,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Product",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: 'steve'),
                      ),
                      const SizedBox(height: 10,),
                      Text(widget.item)
                    ]
                )
            ),
            const Icon(Icons.info,color: Colors.grey,),
            const SizedBox(width: 16,)
          ],
        ),
      ),
    );
  }
}



class ListItemHistory extends StatefulWidget {
  const ListItemHistory(
      {Key? key,
        required this.item,
        required this.onClick,  this.icon});

  final String item;
  final  icon;
  final VoidCallback onClick;
  @override
  _ListItemHistoryState createState() => _ListItemHistoryState();
}

class _ListItemHistoryState extends State<ListItemHistory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: Container(
        margin: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
            color: Color(0xfff6f5f8),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        width: MediaQuery.of(context).size.width,
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 16),
            Container(
              height: 40,
              width: 40,
              decoration:  BoxDecoration(
                  color: const Color(0xfff54748).withOpacity(0.1),
                  borderRadius:
                  const BorderRadius.all(Radius.circular(10))),
              child: const Center(
                  child: Icon(
                    Icons.fastfood,
                    color: Color(0xfff54748),
                    size: 22,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Product",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: 'steve'),
                      ),
                      const SizedBox(height: 10,),
                      Text(widget.item)
                    ]
                )
            ),
            const Icon(Icons.info,color: Colors.grey,),
            const SizedBox(width: 16,)
          ],
        ),
      ),
    );
  }
}
