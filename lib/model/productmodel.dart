
class market
{
  String ?name;
  String ?address;
  market({
    required this.name,
    required this.address
  });
}
class product {
  String ?id;
  String ?name;
  int ?price;
  var rate;
  String ?description;
  String ?imageUrl;
  market mymarket;
  bool ?cart;
  product({
    required this.id,
    required this.name,
    required this.price,
    required this.rate,
    required this.description,
    required this.imageUrl,
    required this.mymarket,
    required this.cart

  });
}