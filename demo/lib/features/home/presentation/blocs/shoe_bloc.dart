import 'package:demo/features/home/data/datasources/shoe_service.dart';
import 'package:demo/features/home/domain/entities/shoe.dart';
import 'package:demo/features/home/presentation/blocs/shoe_event.dart';
import 'package:demo/features/home/presentation/blocs/shoe_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoeBloc extends Bloc<ShoeEvent, ShoeState> {
  ShoeBloc() : super(InitialShoeState()) {
    on<GetShoes>((event, emit) async {
      emit(LoadingShoeState());

      try {
        List<Shoe> shoes = await ShoeService().getShoes();
        emit(LoadedShoeState(shoes: shoes));
      } catch (e) {
        emit(ErrorShoeState(message: e.toString()));
      }
    });
  }
}
