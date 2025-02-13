import 'package:flutter/material.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/screens/home/views/character_details_view.dart';

class CharacterCard extends StatelessWidget {
  final Person person;

  const CharacterCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: person.name,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.scale(
              scale: value,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CharacterDetailView(person: person)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.blueAccent,
                          child: Icon(Icons.person, size: 40, color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          person.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text("Height: ${person.height}", style: const TextStyle(fontSize: 12)),
                        Text("Birth Year: ${person.birthYear}", style: const TextStyle(fontSize: 12)),
                        Text("Gender: ${person.gender}", style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
