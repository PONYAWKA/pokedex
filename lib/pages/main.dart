import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pokedex/pages/home/view/home.dart';

void main() => runApp(ProviderScope(child: MaterialApp(home: Home())));

