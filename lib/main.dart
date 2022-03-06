import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormularioTransferencia(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController controladorCampoValor = TextEditingController();

  FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controladorCampoNumeroConta,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                labelText: 'Número da conta',
                hintText: '000',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controladorCampoValor,
              keyboardType: TextInputType.number,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: '00.0',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? numeroConta =
                  int.tryParse(controladorCampoNumeroConta.text);
              final double? valor = double.tryParse(controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final Transferencia transferenciaCriada =
                    Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: const Text('Confirmar'),
          )
        ],
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(transferencia: Transferencia(100, 2053)),
          ItemTransferencia(transferencia: Transferencia(300, 2053)),
          ItemTransferencia(transferencia: Transferencia(500, 9053)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          print('nheeeaaiuw'); // Add your onPressed code here!
        },
      ),
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

  @override
  String toString() {
    return 'Transferencia: {valor: $valor, numeroConta: $numeroConta}';
  }
}
