import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/screens/navigation/app_route.dart';

class CharacterCard extends StatelessWidget {
  final Person person;

  const CharacterCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: person.name,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration:
            const Duration(milliseconds: AppConstants.animationDurationMs),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.scale(
              scale: value,
              child: Card(
                color: const Color(0xFFE8F9FF),
                elevation: 1,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: InkWell(
                  onTap: () {
                    context.push(AppRoute.characterDetail.path, extra: person);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(
                          AppConstants.defaultCharacterImage,
                          width: 70,
                          color: const Color(0xFF2D336B),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          person.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                            "${AppConstants.characterCardHeight}: ${person.height}",
                            style: const TextStyle(fontSize: 12)),
                        Text(
                            "${AppConstants.characterCardBirthYear}: ${person.birthYear}",
                            style: const TextStyle(fontSize: 12)),
                        Text(
                            "${AppConstants.characterCardGender}: ${person.gender}",
                            style: const TextStyle(fontSize: 12)),
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
