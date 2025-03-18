import 'package:flutter/material.dart';

import 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {} // Represents loading or initial state

class LangSelected extends HomeState {
  final String selectedLanguage;
  final Widget page;

  LangSelected({required this.selectedLanguage, required this.page});
}

class LanguageListUpdated extends HomeState {
  final Map<String, Widget> languagePages;

  LanguageListUpdated({required this.languagePages});
}

abstract class HomeEvent {}

class FetchData extends HomeEvent {}
