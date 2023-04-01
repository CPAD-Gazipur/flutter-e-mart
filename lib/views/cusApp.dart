import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CusApp extends StatefulWidget {
  const CusApp({Key? key}) : super(key: key);

  @override
  State<CusApp> createState() => _CusAppState();
}

class _CusAppState extends State<CusApp> {
  double position = 0.0;

  double sensitivityFactor = 20.0;

  ScrollController scrollViewColtroller = ScrollController();

  String message = '';

  bool isUP = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedContainer(
          height: isUP ? 78.0 : 0,
          duration: const Duration(milliseconds: 400),
          child: const CustomApp(),
        ),
      ),*/
      body: Stack(
        children: [
          SafeArea(
            child: NotificationListener<ScrollUpdateNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollViewColtroller.position.userScrollDirection ==
                    ScrollDirection.reverse) {
                  debugPrint(
                      'User is going down ${scrollViewColtroller.position.pixels}');

                  setState(() {
                    message = 'going down';
                    isUP = true;
                  });
                } else if (scrollViewColtroller.position.userScrollDirection ==
                    ScrollDirection.forward) {
                  debugPrint(
                      'User is going up ${scrollViewColtroller.position.pixels}');

                  if (scrollViewColtroller.position.pixels > 20) {
                    setState(() {
                      message = 'going up';
                      isUP = true;
                    });
                  } else {
                    setState(() {
                      isUP = false;
                    });
                  }
                }
                return true;
              },
              child: SingleChildScrollView(
                controller: scrollViewColtroller,
                physics: const ScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                      ),
                      ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(100, (i) {
                          return Text(i.toString());
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: AnimatedContainer(
              height: isUP ? 78.0 : 0,
              duration: const Duration(milliseconds: 600),
              curve: Curves.linearToEaseOut,
              child: const CustomApp(),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomApp extends StatefulWidget {
  const CustomApp({Key? key}) : super(key: key);

  @override
  State<CustomApp> createState() => _CustomAppState();
}

class _CustomAppState extends State<CustomApp> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'Rokomari',
        style: TextStyle(
          color: Colors.grey,
        ),
      ),
    );
  }
}
