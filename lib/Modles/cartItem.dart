class cartItemModel {
  String item;
  num price;
  String category;
  bool payWhenReceive;
  DateTime dateOfDelivery;

  cartItemModel(
      {required this.item,
      required this.price,
      required this.category,
      required this.payWhenReceive,
      required this.dateOfDelivery});
}
