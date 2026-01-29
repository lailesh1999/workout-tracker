import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final String? title;
  final int? duration;
  final String? difficulty;
  final bool showButton;

  const WorkoutCard({
    super.key,
    required this.title,
    required this.duration,
    required this.difficulty,
    this.showButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// LEFT CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1D1D1D),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),

                /// Time
                Row(
                  children: [
                    const Icon(Icons.access_time,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 6),
                    Text(
                      '${duration ?? 0} min',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                /// Difficulty
                Row(
                  children: [
                    const Icon(Icons.local_fire_department,
                        size: 16, color: Colors.orange),
                    const SizedBox(width: 6),
                    Text(
                      difficulty ?? '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// RIGHT BUTTON
          if (showButton)
            const SizedBox(width: 12),

          if (showButton)
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                minimumSize: const Size(0, 32),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Mark\nComplete",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
    );
  }
}