import 'package:flutter_bloc/flutter_bloc.dart';

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
  Counter() : super(Counterstate(name: '', age: '', place: ''));

  void changeName(String name) {
    emit(state.copyWith(name: name));
  }

  void changeAge(String age) {
    emit(state.copyWith(age: age));
  }

  void changePlace(String place) {
    emit(state.copyWith(place: place));
  }
}




