import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:star_wars_demo/base/theme/theme_provider.dart';
import 'package:star_wars_demo/data/constants/app_constants.dart';
import 'package:star_wars_demo/models/responses/character_card_response.dart';
import 'package:star_wars_demo/screens/navigation/app_route.dart';

class CharacterCard extends StatelessWidget {
  final Person person;

  const CharacterCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;
    final theme = Theme.of(context);

    return Hero(
      tag: person.name,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: AppConstants.animationDurationMs),
        builder: (context, double value, child) {
          return Opacity(
            opacity: value,
            child: Transform.scale(
              scale: value,
              child: Card(
                color: isDarkMode ? theme.cardColor : const Color(0xFFA9B5DF),
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
                          color: isDarkMode ? Colors.white : const Color(0xFF2D336B),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          person.name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),
                        Text(
                          "${AppConstants.characterCardHeight}: ${person.height}",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          "${AppConstants.characterCardBirthYear}: ${person.birthYear}",
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          "${AppConstants.characterCardGender}: ${person.gender}",
                          style: theme.textTheme.bodyMedium,
                        ),
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
