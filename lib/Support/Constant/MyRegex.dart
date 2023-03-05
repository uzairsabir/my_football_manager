class MyRegex {
  static String getEmail() {
    return r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  }

  static String getContactNumber() {
    return r"^(?:[+0]9)?[0-9]{11}$";
  }

  static String getAlphabets() {
    return r"^[A-Za-z]+$";
  }
}
