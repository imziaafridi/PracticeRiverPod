import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//SIMPPLE EXAMOLE

// final searchNotifier = StateNotifierProvider<SearchNotifierProvider, String>(
//   (ref) => SearchNotifierProvider(),
// );
// class SearchNotifierProvider extends StateNotifier<String> {
//   SearchNotifierProvider() : super('');
//   void search(String val) {
//     state = val;
//   }
// }

final searchNotifier =
    StateNotifierProvider<SearchNotifierProvider, SearchModel>(
      (ref) => SearchNotifierProvider(),
    );

class SearchNotifierProvider extends StateNotifier<SearchModel> {
  SearchNotifierProvider() : super(SearchModel(query: '', isChanged: false));

  void search(String val) {
    state = state.copywith(query: val);
  }

  void onChanged(bool val) {
    state = state.copywith(isChanged: val);
  }
}

class SearchModel {
  final String query;
  final bool isChanged;

  SearchModel({required this.query, required this.isChanged});
  //copywith()
  SearchModel copywith({String? query, bool? isChanged}) {
    return SearchModel(
      query: query ?? this.query,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}
