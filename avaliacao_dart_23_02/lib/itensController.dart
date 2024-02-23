import 'package:flutter/material.dart';
import 'package:avaliacao_dart_23_02/itensModel.dart';

class ListaComprasController extends ChangeNotifier {
  List<Item> _itens = [];
  List<Item> get itens => _itens;
  int indice = 0;

  // Métodos CRUD
  void adicionarItem(String nome, String valor) {
    if (nome.isNotEmpty && valor.isNotEmpty) {
      itens.add(Item(nome, valor, false));
      notifyListeners();
    }
  }

  void marcarComprada(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].comprado = true;
      notifyListeners();
    }
  }

  void desmarcarComprada(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].comprado = false;
      notifyListeners();
    }
  }

  void excluirItem(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens.removeAt(indice);
      notifyListeners();
    }
  }
}
