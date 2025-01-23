import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counterstate {
  final String name;
  final String age;
  final String place;

  Counterstate({
    required this.name,
    required this.age,
    required this.place,
  });

  Counterstate copyWith({String? name, String? age, String? place}) {
    return Counterstate(
      name: name ?? this.name,
      age: age ?? this.age,
      place: place ?? this.place,
    );
  }
}

class Counter extends Cubit<Counterstate> {
  Counter() : super(Counterstate(name: '', age: '', place: '')) {
    loadState();
  }

  Future<void> loadState() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('name') ?? '';
    final age = prefs.getString('age') ?? '';
    final place = prefs.getString('place') ?? '';
    emit(Counterstate(name: name, age: age, place: place));
  }

  Future<void> changeName(String name) async {
    final updatedState = state.copyWith(name: name);
    emit(updatedState);
    await _saveToPrefs(updatedState);
  }

  Future<void> changeAge(String age) async {
    final updatedState = state.copyWith(age: age);
    emit(updatedState);
    await _saveToPrefs(updatedState);
  }

  Future<void> changePlace(String place) async {
    final updatedState = state.copyWith(place: place);
    emit(updatedState);
    await _saveToPrefs(updatedState);
  }

  Future<void> _saveToPrefs(Counterstate state) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', state.name);
    await prefs.setString('age', state.age);
    await prefs.setString('place', state.place);
  }
}
