class TransactionModel{
  double amount;
  String type; //WITHDRAWAL - DEPOSIT - TRANSFER
  String date;
  String source;//code - mobileNo - card
  String destination;//code - mobileNo - card
  String code;

  TransactionModel({this.amount, this.type, this.date, this.source, this.destination, this.code});
}