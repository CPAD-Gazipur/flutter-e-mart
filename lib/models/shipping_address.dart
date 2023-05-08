class ShippingAddress {
  final String name, phone, streetAddress, postalCode, city, addressType;
  final num addressTypeIndex;

  ShippingAddress({
    required this.name,
    required this.phone,
    required this.streetAddress,
    required this.postalCode,
    required this.city,
    required this.addressType,
    required this.addressTypeIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'streetAddress': streetAddress,
      'postalCode': postalCode,
      'city': city,
      'addressType': addressType,
      'addressTypeIndex': addressTypeIndex,
    };
  }

  static ShippingAddress fromMap(Map<String, dynamic> map) {
    return ShippingAddress(
      name: map['name'],
      phone: map['phone'],
      streetAddress: map['streetAddress'],
      postalCode: map['postalCode'],
      city: map['city'],
      addressType: map['addressType'],
      addressTypeIndex: map['addressTypeIndex'],
    );
  }
}
