import 'package:bytebank/models/transferencia.dart';
import 'package:bytebank/screens/fomulario_transferencia.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  ListaTransferencias({Key? key}) : super(key: key);
  final List<Transferencia?> _transferencias = [];

  @override
  State<ListaTransferencias> createState() => _ListaTransferenciasState();
}

class _ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, index) {
          return ItemTransferencia(
            transferencia: widget._transferencias[index],
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
              if (transferenciaRecebida != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebida);
                });
              }
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
