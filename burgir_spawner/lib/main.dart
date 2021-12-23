import 'package:burgir_spawner/pages/burgirs_list.dart';
import 'package:flutter/material.dart';
import 'package:burgir_spawner/pages/loading.dart';

void main() => runApp(MaterialApp(
  routes:{
    '/' : (context) => Loading(),
    '/list' : (context) => BurgirsList()
  }
));

