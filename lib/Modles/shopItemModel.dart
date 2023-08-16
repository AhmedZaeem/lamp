class shopItemModel {
  String itemImage;
  String itemName;
  num itemPrice;
  bool isSold;
  String title1;
  String title2;

  shopItemModel({
    required this.itemImage,
    required this.itemName,
    required this.itemPrice,
    this.isSold = false,
    required this.title1,
    required this.title2,
  });
}
