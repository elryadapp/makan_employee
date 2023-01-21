part of 'makan_scanning_cubit.dart';

enum ScanQrCodeStates { initial, loading, loaded, failure }

class MakanScanningState {
  final String? exception;
  final TicketScanResponseModel? ticketScanResponseModel;
  final GameScanResponseModel? gameScanResponseModel;
  final SessionScanResponseModel? sessionScanResponseModel;
  final CampScanResponseModel? campScanResponseModel;
  final ScanQrCodeStates? scanQrCodeStates;

  MakanScanningState({
    this.exception,
    this.scanQrCodeStates,
    this.ticketScanResponseModel,
    this.gameScanResponseModel,
    this.sessionScanResponseModel,
    this.campScanResponseModel,
  });
  MakanScanningState copyWith(
      {String? exception,
      ScanQrCodeStates? scanQrCodeStates,
      TicketScanResponseModel? ticketScanResponseModel,
      GameScanResponseModel? gameScanResponseModel,
      SessionScanResponseModel? sessionScanResponseModel,
      CampScanResponseModel? campScanResponseModel}) {
    return MakanScanningState(
        campScanResponseModel:
            campScanResponseModel ?? this.campScanResponseModel,
        gameScanResponseModel:
            gameScanResponseModel ?? this.gameScanResponseModel,
        sessionScanResponseModel:
            sessionScanResponseModel ?? this.sessionScanResponseModel,
        ticketScanResponseModel:
            ticketScanResponseModel ?? this.ticketScanResponseModel,
        exception: exception ?? this.exception,
        scanQrCodeStates: scanQrCodeStates ?? this.scanQrCodeStates);
  }
}
