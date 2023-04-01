import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBar2Widget extends StatefulWidget {
  const AppBar2Widget({Key? key}) : super(key: key);

  @override
  State<AppBar2Widget> createState() => _AppBar2WidgetState();
}

class _AppBar2WidgetState extends State<AppBar2Widget> {
  late double changingHeight;
  late double appBarHeight;
  bool appBarSearchShow = false;
  final TextEditingController _filter = TextEditingController();

  List<String> itemList = [];

  @override
  void initState() {
    for (int count = 0; count < 50; count++) {
      itemList.add("Item $count");
    }
    changingHeight = 300;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            createSilverAppBar1(innerBoxScrolled),
            createSilverAppBar2(innerBoxScrolled),
          ];
        },
        body: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(itemList[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  SliverAppBar createSilverAppBar1(bool isScrolling) {
    return SliverAppBar(
      backgroundColor: Colors.redAccent,
      floating: false,
      elevation: 0,
      title: Image.network(
        'https://seeklogo.com/images/R/rokomari-logo-02A1B1094C-seeklogo.com.png',
        fit: BoxFit.fill,
        height: 25,
      ),
      actions: [
        const Padding(
          padding: EdgeInsets.only(
            left: 0,
            right: 10,
          ),
          child: Icon(
            Icons.notifications_none_rounded,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
          ),
        ),
        const SizedBox(width: 10),
      ],
/*      expandedHeight: 220,
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 7,
                        bottom: 40,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 49,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                              child: const TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'tracking number',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }

  SliverSafeArea createSilverAppBar2(bool isScrolling) {
    return SliverSafeArea(
      top: false,
      sliver: SliverAppBar(
        backgroundColor: Colors.redAccent,
        pinned: true,
        title: Row(
          children: [
            AnimatedOpacity(
              opacity: isScrolling ? 1 : 0,
              duration: const Duration(
                milliseconds: 500,
              ),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRecu70JlVu7imLCTYAk9CBSzDszQiHWFjxy0U1D1AwO11qsEkD-Noqd6fT1b41CwadoAA&usqp=CAU',
                fit: BoxFit.fill,
                height: 25,
              ),
            ),
            Expanded(
              child: AnimatedSize(
                duration: const Duration(
                  milliseconds: 200,
                ),
                child: AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 200,
                  ),
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  height: 40,
                  child: CupertinoTextField(
                    enabled: false,
                    controller: _filter,
                    keyboardType: TextInputType.text,
                    placeholder: 'Search',
                    placeholderStyle: const TextStyle(
                      color: Color(0xffC4C6CC),
                      fontSize: 14.0,
                      fontFamily: 'Brutal',
                    ),
                    prefix: const Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.black,
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: isScrolling
            ? [
                AnimatedOpacity(
                  opacity: isScrolling ? 1 : 0,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 0,
                      right: 10,
                    ),
                    child: Icon(
                      Icons.notifications_none_rounded,
                    ),
                  ),
                ),
                AnimatedOpacity(
                  opacity: isScrolling ? 1 : 0,
                  duration: const Duration(
                    milliseconds: 500,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
              ]
            : [
                const SizedBox(width: 16),
              ],
      ),
    );
  }
}
