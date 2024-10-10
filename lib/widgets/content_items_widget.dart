import 'package:flutter/material.dart';

class ContentItems extends StatelessWidget {
  final IconData locationIcon;
  final String title;
  final List<Map<String, dynamic>>? additionalItems;

  const ContentItems({
    super.key,
    required this.locationIcon,
    required this.title,
    this.additionalItems,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(locationIcon),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                if (additionalItems != null && additionalItems!.isNotEmpty)
                  for (var item in additionalItems!)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (item['icon'] != null)
                              Icon(item['icon'], size: 16),
                            const SizedBox(width: 4),
                            Text(
                              item['text'] ?? '',
                              style: const TextStyle(
                                  fontSize: 14,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.blueAccent,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              item['text3'] ?? '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              item['additionalText'] ?? '',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            if (item['icon2'] != null)
                              Icon(item['icon2'], size: 16),
                            const SizedBox(width: 4),
                            if (item['text2'] != null &&
                                item['text2']!.isNotEmpty)
                              Text(
                                item['text2']!,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            const SizedBox(width: 8),
                            if (item['additionalText2'] != null &&
                                item['additionalText2']!.isNotEmpty)
                              Text(
                                item['additionalText2']!,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
