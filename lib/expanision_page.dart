import 'package:demo_expansion_title/question.dart';
import 'package:flutter/material.dart';

class ExpansionTitlePage extends StatefulWidget {
  static String idPage = 'ExpansionTitlePage';
  const ExpansionTitlePage({super.key});

  @override
  State<ExpansionTitlePage> createState() => _ExpansionTitlePageState();
}

class _ExpansionTitlePageState extends State<ExpansionTitlePage> {
  final quizz = [
    Question(
      question: 'Cuál de las siguientes actividades disfrutas más',
      options: [
        'Ver peliculas',
        'Escuchar música',
        'Bailar con buena música',
      ],
      opSelected: 0,
      isExpanded: true,
    ),
    Question(
      question: 'Qué programación de televisión prefieres',
      options: [
        'Canal 5',
        'Canal 2',
        'Canal 7',
      ],
      opSelected: 0,
      isExpanded: false,
    ),
    Question(
      question: 'Qué prefieres hacer un sábado',
      options: [
        'Jugar futbol',
        'Ver televisión',
        'Dormir todo el día',
      ],
      opSelected: 0,
      isExpanded: false,
    )
  ];

  void updateExpansion() {
    for (int j = 0; j < quizz.length; j++) {
      quizz[j].isExpanded = false;
    }
    setState(() {});
  }

  void updateRadio({
    required int i,
    required int value,
  }) {
    setState(() {
      quizz[i].opSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ExpansionTitle by ARoSistemas',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => updateExpansion(),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      backgroundColor: Colors.blue.shade100,
      body: ListView.builder(
        itemCount: quizz.length,
        itemBuilder: (_, i) {
          return ExpansionTile(
            key: UniqueKey(),
            initiallyExpanded: quizz[i].isExpanded,
            title: Text(quizz[i].question),
            children: [
              for (int j = 0; j < quizz[i].options.length; j++)
                RadioListTile(
                  value: j,
                  groupValue: quizz[i].opSelected,
                  title: Text(quizz[i].options[j]),
                  onChanged: (int? value) => updateRadio(
                    i: i,
                    value: value ?? 0,
                  ),
                )
            ],
            onExpansionChanged: (bool expanded) {
              updateExpansion();
              quizz[i].isExpanded = expanded;
            },
          );
        },
      ),
    );
  }
}
