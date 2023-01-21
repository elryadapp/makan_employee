import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:makan_employee/core/utils/constants.dart';

part 'makan_state.dart';

class MakanCubit extends Cubit<MakanState> {
  MakanCubit() : super(const MakanInitial());
  static MakanCubit get(context) => BlocProvider.of(context);
  void onUpdateData(String lang) {
    emit(LangState(lang: lang, changed: !state.changed));
  }

  bool isDrawerOpened = true;
  ZoomDrawerController zoomDrawerController = ZoomDrawerController();
  void changeIsDrawerOpened(bool val, context) {
    isDrawerOpened = val;

    zoomDrawerController.toggle?.call();

    emit(ChangeIsDrawerOpendState(
        lang: Constants.lang, changed: !state.changed));
  }

//================scan====================



}
