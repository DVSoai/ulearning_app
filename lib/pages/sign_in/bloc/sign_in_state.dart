class SignInState {
  final bool showPassword;
  final String email;
  final String password;
  const SignInState({
    this.showPassword = false,
    this.email = "",
    this.password = "",
  });

  SignInState copyWith({
    bool? showPassword,
    String? email,
    String? password,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      showPassword: showPassword?? this.showPassword,
    );
  }
}