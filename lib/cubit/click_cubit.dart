import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:statemanager/main.dart';

part 'click_state.dart';

class ClickCubit extends Cubit<ClickState> {
  ClickCubit() : super(WhiteTheme());

  int count = 0;

  void Click() {
    if (state is WhiteTheme) {
      count++;
      list.add("Количество нажатий - $count. Текущая тема - Светлая тема");
      emit(WhiteTheme());
    } else {
      count = count + 2;
      list.add("Количество нажатий - $count. Текущая тема - Тёмная тема");
      emit(BlackTheme());
    }
  }

  void ClickMinus() {
    if (state is WhiteTheme) {
      count--;
      list.add("Количество нажатий - $count. Текущая тема - Светлая тема");
      emit(WhiteTheme());
    } else {
      count = count - 2;
      list.add("Количество нажатий - $count. Текущая тема - Тёмная тема");
      emit(BlackTheme());
    }
  }

  void SwapThere() {
    if (state is WhiteTheme) {
      list.add("Тема переключена на тёмную, количество нажатий - $count");
      emit(BlackTheme());
    } else {
      list.add("Тема переключена на светлую, количество нажатий - $count");
      emit(WhiteTheme());
    }
  }
}
