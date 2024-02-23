import 'package:avaliacao_dart_23_02/itensView.dart';
import 'package:avaliacao_dart_23_02/itensController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaComprasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => ListaComprasController(),
        child: ListaItensScreen(),
      ),
    );
  }
}
