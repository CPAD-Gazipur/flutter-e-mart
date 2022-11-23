import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/views/category_screen/category_details_screen.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          title: categories.text.fontFamily(bold).make(),
          centerTitle: false,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: categoryTitleList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 180,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryImageList[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  5.heightBox,
                  categoryTitleList[index]
                      .text
                      .color(darkFontGrey)
                      .align(TextAlign.center)
                      .make(),
                ],
              )
                  .box
                  .roundedSM
                  .clip(Clip.antiAlias)
                  .padding(const EdgeInsets.all(8.0))
                  .white
                  .outerShadowSm
                  .make()
                  .onTap(
                    () => Get.to(
                      () => CategoryDetailsScreen(
                        title: categoryTitleList[index],
                      ),
                    ),
                  );
            },
          ),
        ),
      ),
    );
  }
}
