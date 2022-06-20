import 'package:flutter/material.dart';

class LanguageModel {
  int id;
  Locale locale;
  String name;

  LanguageModel({required this.id, required this.locale, required this.name});

  Locale toLocale() => locale;
}
