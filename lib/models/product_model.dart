
class ProductModel{
  String name;
  String code;
  String shopCode;
  int cost;
  List<String> imagePath;
  double star;
  bool isRemovable;
  bool hasOnlineSell;
  String category;
  String description;
  ProductModel({this.name , this.hasOnlineSell , this.category , this.code , this.cost ,
    this.imagePath , this.star , this.isRemovable , this.shopCode , this.description});
}