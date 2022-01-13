class Utils{
  static bool isTextEmpty(String text){
    if(text == null || text.isEmpty ||text.trim() == '' || text.trim() == "")
      return true;
    else
      return false;
  }

  static bool isMobileNumberValid(String mobileNo){
    if(!isTextEmpty(mobileNo)){
      if(mobileNo.length != 12 || (mobileNo.trim().startsWith('+')) ||
          (mobileNo.trim().contains('-')))
        return false;
      else return true;
    } else return false;
  }

}