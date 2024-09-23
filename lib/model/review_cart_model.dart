class ReviewCartModel {
  String? cartId;
  String? cartImage;
  String? cartName;
  String? cartPrice;
  int? cartQuantity;
  String? productImage;
  int? productPrice;
  var cartUnit;

  ReviewCartModel(
      {this.cartId,
      this.cartImage,
      this.cartName,
      this.cartPrice,
      this.cartQuantity,
      this.cartUnit});
}
