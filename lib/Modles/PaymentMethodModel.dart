class paymentMethodModel {
  String image;
  String title;
  String? subTitle;

  paymentMethodModel({
    required this.image,
    required this.title,
    this.subTitle,
  });
}
