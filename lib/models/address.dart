class AddressModel{
  String province;
  String city;
  String address;
  String postalCode;
  AddressModel({this.address,this.city,this.province, this.postalCode});

  static String makeAddressString(AddressModel a){
    return  "${a.province}، ${a.city}، ${a.address}";
  }
}