part of 'main_services_cubit.dart';

enum GetPermissionsStates { initial, loading, loaded, failure }

class MainServicesState {
  final String? exception;
  final PermessionsModel? permessionsModel;
  final GetPermissionsStates? getPermissionsStates;

  MainServicesState({
    this.exception,
    this.permessionsModel,
    this.getPermissionsStates,
  });

  MainServicesState copyWith({
    String? exception,
PermessionsModel? permessionsModel,
GetPermissionsStates? getPermissionsStates,
  }){
    return MainServicesState(
      exception: exception??this.exception,
      getPermissionsStates: getPermissionsStates??this.getPermissionsStates,
      permessionsModel: permessionsModel?? this.permessionsModel
    );

  }
}
