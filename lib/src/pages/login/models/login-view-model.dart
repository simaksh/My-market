class LoginViewModel {
  final String userName;
  final String password;
  final String id;
  final bool isAdmin;
  final String firstName;
  final String lastName;

  LoginViewModel(
      {required this.id,
        required this.isAdmin,
        required this.firstName,
        required this.lastName,
        required this.userName,
        required this.password});

  factory LoginViewModel.fromJson(final Map<String, dynamic> json) =>
      LoginViewModel(
          userName: json['userName'],
          password: json['password'],
          id: json['id'],
          isAdmin: json['isAdmin'],
          firstName: json['firstName'],
          lastName: json['lastName']);
}
