///class for all validators in whole app
class TextFormFieldsValidator {
  ///validator for name and last name
  static nameValidator(String validator) {
    return (value) {
      if (value == null) {
        return validator;
      } else if (value.trim().length < 3) {
        return validator;
      }
      return null;
    };
  }

  ///validator for password
  static passwordValidator(String validator) {
    return (value) {
      if (value == null) {
        return validator;
      } else if (value.trim().length < 8) {
        return validator;
      }
      return null;
    };
  }
}
