part of 'games_cubit.dart';
enum GetGamesStates{
  initial,loaded,loading,failure
}

 class GamesState {
   final String? exception;
  final GamesModel? gameModel;
  final GetGamesStates? getGameState;

  const GamesState(
      {this.exception,
      this.gameModel,
      this.getGameState = GetGamesStates.initial});

  GamesState copyWith({
    String? exception,
GamesModel?        gameModel,
GetGamesStates? getGameState,
  }){
    return GamesState(
      exception: exception??this.exception,
       gameModel: gameModel??this.gameModel,
       getGameState: getGameState??this.getGameState
    );} 
 }

