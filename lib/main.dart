import 'package:flutter/material.dart';

void main() => runApp(const BytebankApp());

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListaTransferencias(),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controladorCampoNumeroConta =
        TextEditingController();
    final TextEditingController controladorCampoValor = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando transferência'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            controlador: controladorCampoNumeroConta,
            rotulo: 'Número da conta',
            dica: '000',
          ),
          Editor(
            controlador: controladorCampoValor,
            rotulo: 'Valor',
            dica: '00.0',
            icone: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () {
              criaTransferencia(
                controladorCampoNumeroConta.text,
                controladorCampoValor.text,
                context,
              );
            },
            child: const Text('Confirmar'),
          )
        ],
      ),
    );
  }
}

void criaTransferencia(String accountNum, String value, BuildContext context) {
  final int? numeroConta = int.tryParse(accountNum);
  final double? valor = double.tryParse(value);

  if (numeroConta != null && valor != null) {
    final Transferencia transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  const Editor({
    required this.controlador,
    required this.rotulo,
    required this.dica,
    this.icone,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        keyboardType: TextInputType.number,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
      ),
    );
  }
}

class ListaTransferencias extends StatelessWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Transferencia?> transferencias = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: transferencias.length,
        itemBuilder: (context, index) {
          return ItemTransferencia(
            transferencia: transferencias[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future<Transferencia?> future = Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const FormularioTransferencia();
            }),
          );
          future.then(
            (Transferencia? transferenciaRecebida) {
              debugPrint('CHEGOU NO THEN DO FUTURE CARALHO');
              debugPrint('$transferenciaRecebida');
              transferencias.add(transferenciaRecebida);
            },
          );
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia? transferencia;

  const ItemTransferencia({required this.transferencia, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia!.valor.toString()),
        subtitle: Text(transferencia!.numeroConta.toString()),
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
