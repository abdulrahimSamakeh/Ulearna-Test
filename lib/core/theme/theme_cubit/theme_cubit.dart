import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../storage/shared/shared_pref.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());
  toggleTheme() {
    AppSharedPreferences.cashTheme(isLight: !state.isLightMode);
    emit(state.copyWith(isLightMode: !state.isLightMode));
  }
}
