import 'package:flutter/material.dart';
import 'package:workout_tracker/ui/workout_details/ui/widgets/info_chips.dart';

import '../../../../core/data_models/workout.dart';

class HeaderSection extends StatelessWidget {
  final Workout workout;

  const HeaderSection({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            workout.title.toString(),
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              InfoChip(
                icon: Icons.access_time,
                label: "${workout.durationMinutes} min",
              ),
              const SizedBox(width: 10),
              InfoChip(
                icon: Icons.local_fire_department,
                label: workout.difficulty.toString(),
                color: Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
