import 'package:demo/features/home/domain/entities/shoe.dart';

abstract class ShoeEvent {
  const ShoeEvent();
}

class GetShoes extends ShoeEvent {}

class ToggleShoeEvent extends ShoeEvent {
  final Shoe shoe;
  const ToggleShoeEvent({required this.shoe});
}