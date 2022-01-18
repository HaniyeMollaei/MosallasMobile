class AppConstants {
  static const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  static const farsi = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  static String USER_TYPE;
  static String SHOP_NAME;
  static String SHOP_PROVINCE;
  static String SHOP_CITY;
  static String SHOP_CATEGORY;
  static String SHOP_CODE;
  static String MOBILE_NUMBER;
  static String BUYER_NAME;
  static String BUYER_PROVINCE;
  static String BUYER_CITY;
  static int BALANCE = 0;

  static clearAllConstants() {
    USER_TYPE = null;
    SHOP_PROVINCE = null;
    SHOP_CITY = null;
    SHOP_NAME = null;
    SHOP_CATEGORY = null;
    SHOP_CODE = null;
    BUYER_PROVINCE = null;
    BUYER_CITY = null;
    MOBILE_NUMBER = null;
    BUYER_NAME = null;
    BALANCE = 0;
  }

  static getAllConstants() {
    print("USER_TYPE:       $USER_TYPE ");
    print("SHOP_NAME:       $SHOP_NAME ");
    print("SHOP_PROVINCE:   $SHOP_PROVINCE ");
    print("SHOP_CITY:       $SHOP_CITY ");
    print("SHOP_CATEGORY:   $SHOP_CATEGORY ");
    print("SHOP_CODE:       $SHOP_CODE ");
    print("BUYER_NAME:      $BUYER_NAME ");
    print("BUYER_PROVINCE:  $BUYER_PROVINCE ");
    print("BUYER_CITY:      $BUYER_CITY ");
    print("MOBILE_NUMBER:   $MOBILE_NUMBER ");
    print("BALANCE:         ${BALANCE.toString()} ");
  }

  static setConstant({String attribute, String choosedValue}) {
    switch (attribute) {
      case "SHOP_CATEGORY":
        SHOP_CATEGORY = choosedValue;
        break;
      case "SHOP_PROVINCE":
        SHOP_PROVINCE = choosedValue;
        break;
      case "SHOP_CITY":
        SHOP_CITY = choosedValue;
        break;
      case "BUYER_CITY":
        BUYER_CITY = choosedValue;
        break;
      case "BUYER_PROVINCE":
        BUYER_PROVINCE = choosedValue;
        break;
      case "MOBILE_NUMBER":
        MOBILE_NUMBER = choosedValue;
        break;
      case "USER_TYPE":
        USER_TYPE = choosedValue;
        break;
      case "BALANCE":
        BALANCE = int.parse(choosedValue);
        break;
      default:
        break;
    }
  }
}
