import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/dummy_data.dart';
enum Filters { goltenfree, lactosfree, vegetarian, vegan }

class FilterNotifer extends StateNotifier<Map<Filters,bool>>{
FilterNotifer() : super({
  Filters.goltenfree:false,
  Filters.lactosfree:false,
  Filters.vegetarian:false,
  Filters.vegan:false
});
void setfilters(Map<Filters,bool> choosenfilters){
  state=choosenfilters;
}
void setfilter(Filters filter,bool isactive){
  state={...state,
  filter:isactive
  };
}
}


final filterprovider= StateNotifierProvider<FilterNotifer,Map<Filters,bool>>((ref) => FilterNotifer());
final filtermealsprovider= Provider((ref) {
final selectedfilter = ref.watch(filterprovider);
  return dummymeals.where((meal) {
      if (selectedfilter[Filters.goltenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedfilter[Filters.lactosfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedfilter[Filters.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedfilter[Filters.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
});