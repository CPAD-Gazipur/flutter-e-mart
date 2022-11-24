import '../../consts/consts.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String title;

  const ProductDetailsScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        elevation: 0,
        title: title.text
            .maxLines(1)
            .fontFamily(bold)
            .ellipsis
            .color(darkFontGrey)
            .make(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
