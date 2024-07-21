// class Question {
//   final String question;
//   final List<String> options;

//   Question({required this.question, required this.options});

//   factory Question.fromMap(Map<String, dynamic> map) {
//     return Question(
//       question: map['question'] as String,
//       options: List<String>.from(map['options']),
//     );
//   }
// }

class Question {
  String question;
  List<String> options;
  int opSelected;
  bool isExpanded;

  Question({
    required this.question,
    required this.options,
    required this.opSelected,
    required this.isExpanded,
  });
}
