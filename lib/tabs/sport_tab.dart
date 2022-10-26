import 'package:flutter/material.dart';
import 'package:sports_gym/models/sport.dart';
import 'package:sports_gym/resources/strings.dart';

class SportTab extends StatelessWidget {
  const SportTab({
    Key? key,
    required this.sport,
  }) : super(key: key);

  final Sport sport;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Image.network(
            sport.cover,
            fit: BoxFit.cover,
            loadingBuilder: (_, child, loadingProgress) =>
                loadingProgress != null
                    ? const Center(child: CircularProgressIndicator())
                    : child,
          ),
        ),
        const SizedBox(height: 15.0),
        Expanded(
          flex: 2,
          child: cardSection(theme, Strings.news),
        ),
        const SizedBox(height: 15.0),
        Expanded(
          flex: 2,
          child: cardSection(theme, Strings.videos),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }

  Padding cardSection(ThemeData theme, String header) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(header, style: theme.textTheme.subtitle1),
          Expanded(
            child: Row(
              children: List.generate(
                4,
                (index) {
                  return Expanded(
                    child: Card(
                      child: Center(
                        child: Text('$index'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}