import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../Data/Model/Categories/categoriesResponse.dart';
import '../../Repository/CategoriesRepository/categories_repository.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesRepository categoriesRepository =CategoriesRepository();
  CategoriesCubit() : super(CategoriesInitial());

  void getCategories(String? token) {
    categoriesRepository.getCategories(token).then((value) =>{
      if(value!=null){
        emit(CategoriesLoaded(categoriesResponse: value))
      }
    });
  }


}
