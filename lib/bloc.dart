import 'package:flutter_bloc/flutter_bloc.dart';

class incrementCounter extends Cubit<int> {
  incrementCounter() : super(0);
void Increment()=> emit(state +1);
void decrement()=> emit(state -1);


}

class counter extends  BlocObserver{

void onChange(BlocBase bloc, Change change) {
super.onChange(bloc, change);
print('${change.runtimeType}$change');
}
}