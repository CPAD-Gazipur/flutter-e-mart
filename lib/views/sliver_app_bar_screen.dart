import 'package:flutter/material.dart';

class SliverAppBarScreen extends StatelessWidget {
  const SliverAppBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
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
                collapsedHeight: 110,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 25,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Search by books,',
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                bottom: const TabBar(
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
              ),
            ];
          },
          body: TabBarView(
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
                child: Text('HELLO 2'),
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
      ),
    );
  }
}
