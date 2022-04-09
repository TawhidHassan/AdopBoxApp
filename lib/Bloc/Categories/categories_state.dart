part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}
class CategoriesLoaded extends CategoriesState {
  final CategoriesResponse? categoriesResponse;
  CategoriesLoaded({this.categoriesResponse});
}