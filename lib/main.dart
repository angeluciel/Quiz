import 'package:flutter/material.dart';
import 'package:pokemon_quiz_v2/pokemon_list.dart';
import 'package:pokemon_quiz_v2/pokemon_service.dart';
import 'package:pokemon_quiz_v2/quiz_brain.dart';
import 'package:pokemon_quiz_v2/quiz_page.dart';

void main() {
  runApp(const MaterialApp(home: PokemonQuiz()));
}

class PokemonQuiz extends StatefulWidget {
  const PokemonQuiz({Key? key}) : super(key: key);

  @override
  State<PokemonQuiz> createState() => _PokemonQuizState();
}

class _PokemonQuizState extends State<PokemonQuiz> {
  final textStyle = TextStyle(fontSize: 20);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PokemonList>(
      future: fetchPokemonList(),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Center(child: Text('Um erro ocorreu: ${snapshot.error}', style: textStyle,));
        } else if(snapshot.hasData) {
          return QuizPage(pokemonList: snapshot.data!);
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      }
    );
  }
}
