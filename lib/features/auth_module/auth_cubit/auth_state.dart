part of 'auth_cubit.dart';
enum LoginStatus { initial, loading, success, failure }
enum LogoutStatus { initial, loading, success, failure }
class AuthState {
  final LoginStatus loginStatus;
    final LogoutStatus logoutStatus;

  final String? exception;
  final UserModel? userData;

  AuthState({this.loginStatus=LoginStatus.initial,
  this.logoutStatus=LogoutStatus.initial,
  
    this.exception,
     this.userData});

  AuthState copyWith({
  final LoginStatus? loginStatus,
  final LogoutStatus? logoutStatus,
  final String? exception,
  final UserModel? userData,

  }){
    return AuthState(
      logoutStatus:logoutStatus??this.logoutStatus ,
      exception: exception??this.exception,
      loginStatus: loginStatus??this.loginStatus,
      userData: userData??this.userData

    );

  }
  


}

