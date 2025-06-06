import 'package:demo/features/home/domain/entities/shoe.dart';

abstract class ShoeState {
  const ShoeState();
}

class InitialShoeState extends ShoeState {}

class LoadingShoeState extends ShoeState {}

class LoadedShoeState extends ShoeState {
  final List<Shoe> shoes;
  const LoadedShoeState({required this.shoes});
}

class ErrorShoeState extends ShoeState {
  final String message;
  const ErrorShoeState({required this.message});
}


