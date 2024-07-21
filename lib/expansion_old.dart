// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';

// class TypeLearningScreen extends ConsumerStatefulWidget {
//   final int currentPage;
//   final List<String>? answers;

//   const TypeLearningScreen(
//       {super.key, required this.currentPage, this.answers});

//   @override
//   _TypeLearningScreenState createState() => _TypeLearningScreenState();
// }

// class _TypeLearningScreenState extends ConsumerState<TypeLearningScreen> {
//   bool isLoading = true;
//   final int questionPerPage = 8;
//   List<String> values = ['a', 'b', 'c'];
//   late List<String> answers = widget.answers ?? [];
//   late List<Question> questions;
//   late List<String?> selectOptions = [];
//   late List<bool> isExpanded;

//   @override
//   void initState() {
//     super.initState();
//     loadQuestions();
//   }

//   Future<void> loadQuestions() async {
//     final getQuestions = ref.read(getQuestionsProvider);
//     questions = await getQuestions(widget.currentPage);
//     selectOptions = List<String?>.filled(questions.length, null);
//     isExpanded = List<bool>.filled(questions.length, false);
//     isExpanded[0] = true;
//     setState(() {
//       isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final double screenHeight = MediaQuery.of(context).size.height;
//     if (isLoading) {
//       return const Scaffold(
//         body: Center(child: CircularProgressIndicator()),
//       );
//     }
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color.fromRGBO(149, 99, 212, 1),
//         automaticallyImplyLeading: false,
//         centerTitle: true,
//         title: const Text(
//           'Encuesta',
//           style: TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               for (int index = 0; index < questions.length; index++)
//                 ExpansionTile(
//                   initiallyExpanded: isExpanded[index],
//                   title: Text(questions[index].question),
//                   children: <Widget>[
//                     for (int i = 0; i < questions[index].options.length; i++)
//                       RadioListTile(
//                         value: values[i],
//                         groupValue: selectOptions[index],
//                         title: Text(questions[index].options[i]),
//                         onChanged: (value) {
//                           selectOptions[index * widget.currentPage] = value;
//                           setState(() {});
//                         },
//                       ),
//                   ],
//                   onExpansionChanged: (expanded) {
//                     setState(() {
//                       for (int i = 0; i < isExpanded.length; i++) {
//                         isExpanded[i] = i == index ? expanded : false;
//                       }
//                     });
//                   },
//                 ),
              
//               SizedBox(height: screenHeight * 0.05),

//               SizedBox(
//                 width: screenWidth * 0.3,
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     if (widget.currentPage == 5) {
//                       // Llamada a la api
//                     }
//                     if (selectOptions.contains(null)) {
//                       // Aca se emite una alerta de que no se lleno todo
//                     }
//                     final encodedAnswers = selectOptions.join(',');
//                     context.go(
//                         '/type-learning/${widget.currentPage + 1}/answers/${Uri.encodeComponent(encodedAnswers)}');
//                   },
//                   label: Icon(Icons.arrow_forward_outlined,
//                       color: Colors.white, size: screenWidth * 0.08),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromRGBO(118, 10, 120, 1),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding:
//                         const EdgeInsets.all(16), // Padding dentro del botón
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
