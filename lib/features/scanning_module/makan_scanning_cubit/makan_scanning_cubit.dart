import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/config/app_routes/app_routes.dart';
import 'package:makan_employee/core/errors/expations.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/data/models/camp_response_model.dart';
import 'package:makan_employee/data/models/game_response_model.dart';

import 'package:makan_employee/data/models/sessions_response_model.dart';
import 'package:makan_employee/data/models/ticket_scan_response_model.dart';
import 'package:makan_employee/data/repositories/auth_repo.dart';
part 'makan_scanning_state.dart';

class MakanScanningCubit extends Cubit<MakanScanningState> {
  MakanScanningCubit() : super(MakanScanningState());
  static MakanScanningCubit get(context) => BlocProvider.of(context);
  int? gameId;
  String? type;
  //==================scanning=====================
  dynamic ScanDataModel;
  Future<void> scanningQrCode({
    context,
    id,
  }) async {
    ScanDataModel = null;
    emit(state.copyWith(scanQrCodeStates: ScanQrCodeStates.loading));

    try {
      final mainCategoryModel = await AuthRepo.scanTicket(
          id: id, query: {'type': type, 'game_id': gameId});

      switch (type) {
        case '1':
          ScanDataModel = TicketScanResponseModel.fromJson(mainCategoryModel);
          break;
        case '2':
          ScanDataModel = GameScanResponseModel.fromJson(mainCategoryModel);
          break;
        case '3':
          ScanDataModel = SessionScanResponseModel.fromJson(mainCategoryModel);
          break;
        case '4':
          ScanDataModel = CampScanResponseModel.fromJson(mainCategoryModel);
          break;
      }
 Navigator.pushReplacementNamed(
                  context,
                  Routes.scanResultScreen,
                  arguments:  MakanScanningCubit.get(context).ScanDataModel
                  
                );
      if (mainCategoryModel['success'] == false) {
        AppUtil.appAlert(context,
            msg: mainCategoryModel['message'][0],
            contentType: ContentType.failure);
        emit(
          state.copyWith(
            scanQrCodeStates: ScanQrCodeStates.failure,
          ),
        );
      } else {
        emit(state.copyWith(
          scanQrCodeStates: ScanQrCodeStates.loaded,
        ));
      }
    } catch (exception) {
      debugPrint("exception-----------------------------$exception");
      emit(
        state.copyWith(
          scanQrCodeStates: ScanQrCodeStates.failure,
          exception: getExptionMessageMessage(exception),
        ),
      );
    }
  }
}
