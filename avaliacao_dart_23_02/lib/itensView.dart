import 'package:avaliacao_dart_23_02/itensController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListaItensScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Lista de Compras'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Campos de texto para adicionar o nome e o valor do item.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Adicionar nome do item',
              ),
            ),
          ),
          // Campo de texto para adicionar nova tarefa
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller2,
              decoration: InputDecoration(
                labelText: 'Adicionar valor do item',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () {
                    // Chamando o método adicionarItem do Provider para atualizar o estado
                    Provider.of<ListaComprasController>(context, listen: false)
                        .adicionarItem(_controller.text, _controller2.text);
                    // Limpar o campo de texto após adicionar a tarefa
                    _controller.clear();
                    _controller2.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          // Lista de compras usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<ListaComprasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.itens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição do nome do item
                      title: Text(model.itens[index].nome.trim()),
                      // Exibição do valor do item
                      subtitle: Text(model.itens[index].valor.trim()),
                      // Checkbox para marcar a tarefa como concluída
                      trailing: Checkbox(
                        value: model.itens[index].comprado,
                        onChanged: (value) {
                          // Usando if else para saber se o item foi comprado ou não
                          // Chamando o método marcarComprada do Provider para atualizar o estado
                          if (model.itens[index].comprado == false) {
                            model.marcarComprada(index);
                            // Chamando o método desmarcarComprada para atualizar o estado
                          } else {
                            model.desmarcarComprada(index);
                          }
                          ;
                        },
                      ),
                      // Exclui a o item da lista ao manter pressionado
                      onLongPress: () {
                        // Chamando o método excluirItem do Provider para atualizar o estado
                        model.excluirItem(index);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
