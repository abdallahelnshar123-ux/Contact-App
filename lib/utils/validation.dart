class Validation {
  static String? isEmptyFieldValidator(String? value, String message) {
    if (value?.isEmpty ?? true) return message;

    return null;
  }

  static bool isEmailValidator(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  static String? emailValidator(String? value) {
    String? result = isEmptyFieldValidator(value, 'You should Enter Email');
    if (result == null) {
      if (!isEmailValidator(value!)) {
        result = 'Invalid email';
      }
    }
    return result;
  }
}
