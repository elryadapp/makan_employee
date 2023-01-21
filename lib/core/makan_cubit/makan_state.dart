part of 'makan_cubit.dart';


abstract class MakanState {
  final String lang;
  final bool changed;
  const MakanState({required this.lang, required this.changed});
}

class MakanInitial extends MakanState {
    const MakanInitial() : super(lang: "ar", changed: false);


}
class LangState extends MakanState {
  const LangState({required String lang, required bool changed})
      : super(lang: lang, changed: changed);



 
}
class ChangeIsDrawerOpendState extends MakanState {
  ChangeIsDrawerOpendState({required super.lang, required super.changed});
 
}