//AuthCredentials é uma classe abstrata que usaremos para uma linha de base das informações mínimas necessárias para executar login ou cadastro.
//Isso permitirá o uso de LoginCredentials e SignUpCredentials de forma quase intercambiável.
abstract class AuthCredentials {
  final String username;
  final String password;

  AuthCredentials({required this.username, required this.password});
}

//LoginCredentials é uma implementação concreta simples de AuthCredentials pois o registro em log só exige nome do usuário e senha.
class LoginCredentials extends AuthCredentials {
  LoginCredentials({required String username, required String password})
      : super(username: username, password: password);
}

//Quase idêntico ao LoginCredentials, mas com e-mail como campo adicionado exigido para cadastro.
class SignUpCredentials extends AuthCredentials {
  final String email;

  SignUpCredentials(
      {required String username, required String password, required this.email})
      : super(username: username, password: password);
}
