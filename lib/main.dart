import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Transferências'),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                print('nheeeaaiuw'); // Add your onPressed code here!
              },
            ),
            body: const ListaTransferencias()),
      ),
    );

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ItemTransferencia(transferencia: Transferencia(100, 2053)),
        ItemTransferencia(transferencia: Transferencia(300, 2053)),
        ItemTransferencia(transferencia: Transferencia(500, 9053)),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({required this.transferencia, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(
    this.valor,
    this.numeroConta,
  );
}
