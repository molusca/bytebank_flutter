import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const String _tituloAppBar = 'Criando transferência';
const String _rotuloNumeroConta = 'Número da conta';
const String _dicaNumeroConta = '000';
const String _rotuloValor = 'Valor';
const String _dicaValor = '00.0';
const String _textoBotaoConfirmar = '00.0';

class FormularioTransferencia extends StatelessWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controladorCampoNumeroConta =
        TextEditingController();
    final TextEditingController controladorCampoValor = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: controladorCampoNumeroConta,
              rotulo: _rotuloNumeroConta,
              dica: _dicaNumeroConta,
            ),
            Editor(
              controlador: controladorCampoValor,
              rotulo: _rotuloValor,
              dica: _dicaValor,
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
              child: const Text(_textoBotaoConfirmar),
            ),
          ],
        ),
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
