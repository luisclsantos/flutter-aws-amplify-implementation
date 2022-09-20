import 'dart:async';

import 'auth_credentials.dart';

//Enumerador que cobrirá os quatro estados diferentes possíveis do fluxo de autenticação: página de login, página de cadastro, página de verificação ou uma sessão.
enum AuthFlowStatus { login, signUp, verification, session }

//Objeto real que observaremos em nosso stream e ele conterá authFlowStatus como uma propriedade.
class AuthState {
  final AuthFlowStatus authFlowStatus;

  AuthState({required this.authFlowStatus});
}

//O AuthService terá dois objetivos: gerenciar o controlador de stream de AuthState e conter toda a funcionalidade de autenticação que será adicionada no próximo módulo.
class AuthService {
  //authStateController é responsável por enviar novo downstream AuthState a ser observado.
  final authStateController = StreamController<AuthState>();

  //Esta é uma função simples para atualizar o stream AuthState para signUp.
  void showSignUp() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.signUp);
    authStateController.add(state);
  }

  //Isso não equivale a showSignUp, mas atualiza o stream para enviar login.
  void showLogin() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.login);
    authStateController.add(state);
  }

  //Quando um usuário passar AuthCredentials, executaremos uma certa lógica e, por fim, colocaremos o usuário em um estado da sessão.
  void loginWithCredentials(AuthCredentials credentials) {
    final state = AuthState(authFlowStatus: AuthFlowStatus.session);
    authStateController.add(state);
  }

  //O cadastro exigirá que o e-mail inserido seja verificado inserindo um código de verificação. Então, a lógica de cadastro deve alterar o estado para verificação.
  void signUpWithCredentials(SignUpCredentials credentials) {
    final state = AuthState(authFlowStatus: AuthFlowStatus.verification);
    authStateController.add(state);
  }

  //Método para tratar o código de verificação e atualizar o estado para sessão.
  void verifyCode(String verificationCode) {
    final state = AuthState(authFlowStatus: AuthFlowStatus.session);
    authStateController.add(state);
  }

  //Método de saída do AuthService
  void logOut() {
    final state = AuthState(authFlowStatus: AuthFlowStatus.login);
    authStateController.add(state);
  }
}
