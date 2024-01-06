import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app_with_tdd/domain/entities/weather.dart';
import 'package:weather_app_with_tdd/domain/use_cases/get_current_weather.dart';
import 'package:rxdart/rxdart.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUserCase _getCurrentWeatherUserCase;
  WeatherBloc(this._getCurrentWeatherUserCase) : super(WeatherEmpty()) {
    on<OnCityChange>((event, emit) async {
      emit(WeatherLoading());
      final result = await _getCurrentWeatherUserCase.execute(event.cityName);
      result.fold(
        (failure) => emit(WeatherLoadFailure(failure.message)),
        (success) => emit(WeatherLoaded(success)),
      );
    }, transformer: debounce(const Duration(milliseconds: 500)));
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).flatMap(mapper);
  };
}
