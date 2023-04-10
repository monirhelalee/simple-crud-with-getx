class Validator {
  String? nullFieldValidate(String? value) =>
      value!.isEmpty ? "This field is required" : null;

  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (value!.isEmpty) {
      return "Please enter an email";
    } else if (!regex.hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? notValidate(String value) {
    return null;
  }

  String? validateEmptyPassword(String value) {
    if (value.isEmpty) {
      return "Please enter password";
    } else {
      return null;
    }
  }
}
