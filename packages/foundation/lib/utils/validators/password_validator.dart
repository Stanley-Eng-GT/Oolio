class PasswordValidator {
  const PasswordValidator();

  //Check  minimum Length
  bool hasMinimumLength(String password, int minLength) {
    return password.length >= minLength ? true : false;
  }

  //Checks uppercaseCount
  bool hasMinimumUppercase(String password, int uppercaseCount) {
    String pattern = '^(.*?[A-Z]){$uppercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  //Check lowercaseCount
  bool hasMinimumLowercase(String password, int lowercaseCount) {
    String pattern = '^(.*?[a-z]){$lowercaseCount,}';
    return password.contains(RegExp(pattern));
  }

  //Check numericCount
  bool hasMinimumNumericCharacters(String password, int numericCount) {
    String pattern = '^(.*?[0-9]){$numericCount,}';
    return password.contains(RegExp(pattern));
  }

  //Checks specialCharactersCount special character
  bool hasMinimumSpecialCharacters(
      String password, int specialCharactersCount) {
    String pattern =
        "^(.*?[\$&+,:;/=?@#|'<>.^*()_%!-]){$specialCharactersCount,}";
    return password.contains(RegExp(pattern));
  }
}
