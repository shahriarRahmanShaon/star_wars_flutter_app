import 'package:flutter/material.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';

class CharacterDetailView extends StatelessWidget {
  final Person person;

  const CharacterDetailView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(person.name)),
      body: Center(
        child: Hero(
          tag: person.name,
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.person, size: 80, color: Colors.blueAccent),
                  const SizedBox(height: 16),
                  Text(
                    person.name,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  _buildDetailRow("Height", person.height),
                  _buildDetailRow("Birth Year", person.birthYear),
                  _buildDetailRow("Gender", person.gender),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$label: ", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
