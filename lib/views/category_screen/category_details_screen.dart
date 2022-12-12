import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/controllers/controllers.dart';
import 'package:flutter_e_mart/services/firestore_services.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  const CategoryDetailsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productController = Get.find<ProductController>();

    return backgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: title.text.fontFamily(bold).white.make(),
          centerTitle: false,
          iconTheme: const IconThemeData(
            color: whiteColor,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirestoreServices.getProducts(category: title),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (!snapshot.hasData) {
              return loadingIndicator();
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: 'No Product Found'.text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;

              return Container(
                padding: const EdgeInsets.only(
                  left: 12,
                  right: 12,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// SUB CATEGORY LIST
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: List.generate(
                          productController.subCategory.length,
                          (index) => '${productController.subCategory[index]}'
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .roundedSM
                              .size(130, 50)
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .make(),
                        ),
                      ),
                    ),
                    10.heightBox,

                    /// CATEGORY PRODUCT LIST
                    Expanded(
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: 282,
                        ),
                        itemBuilder: (context, index) {
                          return ProductShortDetails(
                            productDetails: data[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
