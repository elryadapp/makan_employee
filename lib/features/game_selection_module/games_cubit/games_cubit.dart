import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:makan_employee/core/errors/expations.dart';
import 'package:makan_employee/core/utils/app_utilities.dart';
import 'package:makan_employee/data/models/games_model.dart';
import 'package:makan_employee/data/repositories/auth_repo.dart';

part 'games_state.dart';

class GamesCubit extends Cubit<GamesState> {
  GamesCubit() : super(const GamesState());
  static GamesCubit get(context)=>BlocProvider.of(context);
  //==========get all game=============
   Future<void> getGameData(context) async {
    emit(state.copyWith(getGameState: GetGamesStates.loading));

    try {
      final gameModel = await AuthRepo.getAllGames();

      if (gameModel['success'] == false) {
        AppUtil.appAlert(context,
            msg: gameModel['message'][0], contentType: ContentType.failure);
        emit(
          state.copyWith(
            getGameState: GetGamesStates.failure,
          ),
        );
      } else {
        emit(state.copyWith(
            getGameState: GetGamesStates.loaded,
            gameModel: GamesModel.fromJson(gameModel)));
      }
    } catch (exception) {
      debugPrint("exception-----------------------------$exception");
      emit(
        state.copyWith(
          getGameState: GetGamesStates.failure,
          exception: getExptionMessageMessage(exception),
        ),
      );
    }
  }
  

}
