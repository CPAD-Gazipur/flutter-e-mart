import '../../../consts/consts.dart';

class DeliveryDetails extends StatelessWidget {
  final dynamic deliveryAddressDetails;
  const DeliveryDetails({
    Key? key,
    required this.deliveryAddressDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${deliveryAddressDetails.get('name')}',
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: darkFontGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 5,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 6,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: redColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Center(
              child: Text(
                '${deliveryAddressDetails.get('address_type')}'.toUpperCase(),
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  color: whiteColor,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 5),
          Text(
            '${deliveryAddressDetails.get('street_address')} - ${deliveryAddressDetails.get('postal_code')}, ${deliveryAddressDetails.get('city')}',
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: darkFontGrey,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${deliveryAddressDetails.get('phone')}',
            style: const TextStyle(
              fontFamily: 'Roboto',
              color: darkFontGrey,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    )
        .box
        .color(
          Colors.grey.shade100,
        )
        .roundedSM
        .make();
  }
}
