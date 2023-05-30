class CartModel {
  late  final int? id;
  final String? productId;
  final String? productName;
  final double? initialPrice;
  final double? productPrice;
  final int? quantity;
  final String? image;

  CartModel(
      {this.id,
        this.productId,
      this.productName,
      this.initialPrice,
      this.productPrice,
      this.quantity,
      this.image});

  CartModel.fromMap(Map<dynamic, dynamic> result)
      : id = result['id'],
        productId = result['productId'],
        productName = result['productName'],
        initialPrice = result['initialPrice'],
        productPrice = result['productPrice'],
        quantity = result['quantity'],
        image = result['image'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'productId': productId,
      'productName': productName,
      'initialPrice': initialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'image': image
    };
  }
}
