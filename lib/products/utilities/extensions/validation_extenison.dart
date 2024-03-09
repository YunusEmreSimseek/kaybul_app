extension ValidationExtension on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidEmail2 {
    final pattern = RegExp(r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return pattern.hasMatch(trim());
  }

  bool get isValidName {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidName2 {
    final nameRegExp = RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isPasswordValid {
    final containsUpperCase = RegExp(r'[A-Z]').hasMatch(this);
    final containsLowerCase = RegExp(r'[a-z]').hasMatch(this);
    final containsNumber = RegExp(r'\d').hasMatch(this);
    final containsSymbols = RegExp(r'[`~!@#$%\^&*\(\)_+\\\-={}\[\]\/.,<>;]').hasMatch(this);
    final hasManyCharacters = RegExp(r'^.{8,128}$', dotAll: true).hasMatch(this); // This is variable

    return containsUpperCase && containsLowerCase && containsNumber && containsSymbols && hasManyCharacters;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
