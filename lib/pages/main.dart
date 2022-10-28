import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/pages/home/view/home_page.dart';

void main() => runApp(ProviderScope(child: MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false,)));

