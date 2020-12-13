import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reinciarQuestionario;

  Resultado(this.pontuacao, this.reinciarQuestionario);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns!';
    } else if (pontuacao < 12) {
      return 'Você é bom!';
    } else if (pontuacao < 16) {
      return 'Impressionante!';
    } else {
      return 'Nível Jedi!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(fraseResultado,
                      style: TextStyle(fontSize: 28),
                      textAlign: TextAlign.center)),
              FlatButton(
                  onPressed: reinciarQuestionario,
                  child: Text("Reiniciar?",
                      style: TextStyle(fontSize: 18, color: Colors.blue)))
            ]));
  }
}
