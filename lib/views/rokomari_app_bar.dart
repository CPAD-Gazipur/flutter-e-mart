import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverScreen extends StatelessWidget {
  const SliverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SomeDelegate(),
            pinned: true,
            //floating: true,
          ),
          /*SliverAppBar(
            toolbarHeight: 0,
            bottom: TabBar(
              tabs: [
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
                Text('Hello'),
              ],
            ),
          ),*/
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => Container(
                width: double.maxFinite,
                height: 100,
                color: Colors.primaries[index],
              ),
              childCount: Colors.primaries.length,
            ),
          )
        ],
      ),
    );
  }
}

class SomeDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    double p = 0;
    if (shrinkOffset < 60) {
      p = (60 - shrinkOffset) / 100;
    }

    print('PERCENTAGE: $p %');

    return LayoutBuilder(builder: (context, constraints) {
      print("SHRINK: $shrinkOffset");

      Widget smallLogo = Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
        ),
        child: SizedBox.square(
          dimension: 24,
          child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecu70JlVu7imLCTYAk9CBSzDszQiHWFjxy0U1D1AwO11qsEkD-Noqd6fT1b41CwadoAA&usqp=CAU%27'),
        ),
      );

      Widget actions = Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // horizontalGap24,
          // Icon
          // horizontalGap24,
          // horizontalGap24,
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
            ),
          )
        ],
      );

      return Material(
        color: Colors.white,
        elevation: 2,
        child: SafeArea(
          child: SizedBox.expand(
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  //top: MediaQuery.of(context).viewPadding.top,
                  child: actions,
                ),
                Positioned(
                  //top: MediaQuery.of(context).viewPadding.top + 16,
                  left: 16,
                  child: smallLogo,
                ),
                Positioned(
                  top: 0,
                  bottom: 10,
                  left: lerpDouble(
                    20,
                    55,
                    1 - p,
                  ),
                  right: lerpDouble(
                    20,
                    100,
                    1 - p,
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: CupertinoSearchTextField(
                            placeholder: 'Search by books...',
                            placeholderStyle: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade400,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 5,
                            ),
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Colors.grey.shade400,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey.shade100,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 135;

  @override
  // TODO: implement minExtent
  double get minExtent => 90;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
