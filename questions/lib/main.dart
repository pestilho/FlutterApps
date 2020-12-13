import 'package:flutter/material.dart';
import 'Resultado.dart';
import 'questionario.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final List<Map<String, Object>> _perguntas = const [
    {
      "texto": "Qual é a sua cor favorita?",
      "respostas": [
        {"texto": "Preto", "pontuacao": 10},
        {"texto": "Vermelho", "pontuacao": 5},
        {"texto": "Verde", "pontuacao": 3},
        {"texto": "Branco", "pontuacao": 1},
      ]
    },
    {
      "texto": "Qual é o seu animal favorito?",
      "respostas": [
        {"texto": "Coelho", "pontuacao": 10},
        {"texto": "Cachorro", "pontuacao": 5},
        {"texto": "Gato", "pontuacao": 3},
        {"texto": "Leão", "pontuacao": 1},
      ]
    },
    {
      "texto": "Qual é o seu instrutor favorito?",
      "respostas": [
        {"texto": "Maria", "pontuacao": 10},
        {"texto": "João", "pontuacao": 5},
        {"texto": "Leo", "pontuacao": 3},
        {"texto": "Pedro", "pontuacao": 1},
      ]
    }
  ];

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Perguntas"),
      ),
      body: temPerguntaSelecionada
          ? Questionario(
              perguntas: _perguntas,
              perguntaSelecionada: _perguntaSelecionada,
              onAnswer: _responder)
          : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return new _PerguntaAppState();
  }
}
