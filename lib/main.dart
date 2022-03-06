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
          body: Column(
            children: const <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('100.0'),
                  subtitle: Text('15752'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.monetization_on),
                  title: Text('100.0'),
                  subtitle: Text('15752'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
