class MobileNumberValidator {
  const MobileNumberValidator();

  bool validate(String mobileNumber) {
    String pattern = '^04\\d{8}\$';
    return mobileNumber.contains(RegExp(pattern));
  }
}
