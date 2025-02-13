import 'package:flutter/material.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';


class CharacterCard extends StatelessWidget {
  final Person person;

  const CharacterCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(person.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text("Height: ${person.height} | Birth Year: ${person.birthYear} | Gender: ${person.gender}"),
      ),
    );
  }
}
