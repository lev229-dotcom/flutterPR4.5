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
      list.add(
          "Текущее значение счетчика - $count. Текущая тема - Светлая тема");
      text = "Счетчик $count";
      emit(WhiteTheme());
    } else {
      count = count + 2;
      list.add(
          "Текущее значение счетчика - $count. Текущая тема - Тёмная тема");
      text = "Счетчик $count";
      emit(BlackTheme());
    }
  }

  void ClickMinus() {
    if (state is WhiteTheme) {
      count--;
      list.add(
          "Текущее значение счетчика - $count. Текущая тема - Светлая тема");
      text = "Счетчик $count";
      emit(WhiteTheme());
    } else {
      count = count - 2;
      list.add(
          "Текущее значение счетчика - $count. Текущая тема - Тёмная тема");
      text = "Счетчик $count";
      emit(BlackTheme());
    }
  }

  void SwapThere() {
    if (state is WhiteTheme) {
      list.add(
          "Тема переключена на тёмную, текущее значение счетчика - $count");
      emit(BlackTheme());
    } else {
      list.add(
          "Тема переключена на светлую, текущее значение счетчика - $count");
      emit(WhiteTheme());
    }
  }
}
