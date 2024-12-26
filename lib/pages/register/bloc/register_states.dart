class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool showPassword ;
  final bool showConfirmPassword ;

  //optional name parameters
  const RegisterStates({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.confirmPassword = "",
    this.showPassword = false,
    this.showConfirmPassword = false,
  });

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
  }) {
    return RegisterStates(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
    );
  }
}
