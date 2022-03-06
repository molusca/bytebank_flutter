import 'package:flutter/material.dart';

void main() => runApp(
      Column(
        children: <Widget>[
          const Text(
            'Deliver features faster',
            textDirection: TextDirection.ltr,
          ),
          const Text(
            'Craft beautiful UIs',
            textDirection: TextDirection.ltr,
          ),
          Column(
            children: const <Widget>[
              Text(
                'Mensagem 1',
                textDirection: TextDirection.ltr,
              ),
              Text(
                'Mensagem 2',
                textDirection: TextDirection.ltr,
              ),
            ],
          ),
          const Expanded(
            child: FittedBox(
              fit: BoxFit.contain, // otherwise the logo will be tiny
              child: FlutterLogo(),
            ),
          ),
        ],
      ),
    );
