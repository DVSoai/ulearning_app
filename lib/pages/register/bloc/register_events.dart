abstract class RegisterEvent {
  const RegisterEvent();
}

class UsernameEvent extends RegisterEvent {
  final String userName;
  const UsernameEvent( this.userName);
}
class EmailEvent extends RegisterEvent {
  final String email;
  const EmailEvent( this.email);
}
class PasswordEvent extends RegisterEvent {
  final String password;
  const PasswordEvent( this.password);
}
class ConfirmPasswordEvent extends RegisterEvent {
  final String confirmPassword;
  const ConfirmPasswordEvent( this.confirmPassword);
}
class ShowPasswordEvent extends RegisterEvent {
  const ShowPasswordEvent();
}
class ShowConfirmPasswordEvent extends RegisterEvent {
  const ShowConfirmPasswordEvent();
}