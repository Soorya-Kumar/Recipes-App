import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter{
  glutosefree,
  lactosefree,
  vegeterian,
  vegan,
}

class FiltersNotifier extends StateNotifier <Map<Filter, bool>>{

  FiltersNotifier() : super({
    Filter.glutosefree : false,
    Filter.lactosefree: false,
    Filter.vegeterian : false,
    Filter.vegan : false,
  });

  void setAllFilters(Map<Filter, bool> chosenFilters){
    state = chosenFilters;
  }

  void tooglefilters(Filter filter, bool newValue){
    state = {...state, filter : newValue};
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref){
  return FiltersNotifier();
});