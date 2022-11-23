import 'package:flutter_e_mart/consts/consts.dart';
import 'package:flutter_e_mart/widgets/background_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  final String title;
  const CategoryDetailsScreen({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return backgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: title.text.fontFamily(bold).white.make(),
          centerTitle: false,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(
                    6,
                    (index) => 'Women Clothing'
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
                  itemCount: 6,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 260,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          imgP3,
                          //fit: BoxFit.fill,
                          width: 200,
                          // height: 200,
                        ),
                        const Spacer(),
                        'Macbook Pro M1 Chip'
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        5.heightBox,
                        'Apple'
                            .text
                            .fontFamily(regular)
                            .color(fontGrey)
                            .size(12)
                            .make(),
                        10.heightBox,
                        '\$1200'
                            .text
                            .fontFamily(bold)
                            .color(redColor)
                            .size(14)
                            .make(),
                        10.heightBox,
                      ],
                    )
                        .box
                        .white
                        .margin(
                          const EdgeInsets.symmetric(horizontal: 4.0),
                        )
                        .padding(const EdgeInsets.all(12))
                        .roundedSM
                        .outerShadowSm
                        .clip(Clip.antiAlias)
                        .make();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
