import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatefulWidget {
  const SliverAppBarScreen({Key? key}) : super(key: key);

  @override
  State<SliverAppBarScreen> createState() => _SliverAppBarScreenState();
}

class _SliverAppBarScreenState extends State<SliverAppBarScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.purple,
              leading: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              //expandedHeight: 100,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                title: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: CupertinoSearchTextField(
                      padding: const EdgeInsets.all(15),
                      placeholder: 'Search by books,',
                      autocorrect: false,
                      enabled: false,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      onTap: () {},
                    ) /*TextFormField(
                    decoration: const InputDecoration(
                      hintText: '',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                    ),
                  ),*/
                    ),
              ),
              /*bottom: const TabBar(
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                labelStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',
                ),
                labelColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                //labelPadding: EdgeInsets.zero,
                //indicatorPadding: EdgeInsets.zero,
                unselectedLabelColor: Colors.white54,
                isScrollable: true,
                tabs: [
                  Tab(text: 'হোম'),
                  Tab(text: 'বই'),
                  Tab(text: 'ইলেক্ট্রনিক্স'),
                  Tab(text: 'ষ্টেশনারী'),
                  Tab(text: 'ভাউচার'),
                  Tab(text: 'কিডস'),
                  Tab(text: 'ই-বুক'),
                ],
              ),*/
            ),
          ];
        },
        floatHeaderSlivers: true,
        body: Column(
          children: [
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                fontFamily: 'Lato',
              ),
              labelColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              //labelPadding: EdgeInsets.zero,
              //indicatorPadding: EdgeInsets.zero,
              unselectedLabelColor: Colors.white54,
              isScrollable: true,
              tabs: [
                Tab(text: 'হোম'),
                Tab(text: 'বই'),
                Tab(text: 'ইলেক্ট্রনিক্স'),
                Tab(text: 'ষ্টেশনারী'),
                Tab(text: 'ভাউচার'),
                Tab(text: 'কিডস'),
                Tab(text: 'ই-বুক'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            color: Colors.red,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text('Hello $index'),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 200,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://www.rokomari.com/static/200/images/svg/icons/rok-icon-ssl.svg",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Center(
                    child: Text('HELLO 3'),
                  ),
                  Center(
                    child: Text('HELLO 4'),
                  ),
                  Center(
                    child: Text('HELLO 5'),
                  ),
                  Center(
                    child: Text('HELLO 6'),
                  ),
                  Center(
                    child: Text('HELLO 7'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
