import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/data_models/workout.dart';
import '../../../complete_workout/provider/complete_workout_notifier.dart';
import '../../../workout_details/ui/screen/workout_details_screen.dart';

class WorkoutCard extends ConsumerStatefulWidget {
  final String? title;
  final int? duration;
  final int? workout_id;
  final String? difficulty;
  final bool showButton;
  final String? description;

  const WorkoutCard( {
    super.key,
    required this.workout_id,
    required this.title,
    required this.duration,
    required this.difficulty,
    required this.description,
    this.showButton = false,
  });

  @override
  ConsumerState<WorkoutCard> createState() => _WorkoutCardState();
}

class _WorkoutCardState extends ConsumerState<WorkoutCard> {
  @override
  Widget build(BuildContext context) {
    final completeState = ref.watch(completeWorkoutProvider);

    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => WorkoutDetailScreen(
              workout: Workout(
                id: widget.workout_id,
                title: widget.title,
                description: widget.description,
                durationMinutes: widget.duration!,
                difficulty: widget.difficulty!,
              ),
            ),
          ),
        );
      },
      child: Container(
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
                    widget.title ?? '',
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
                      const Icon(Icons.access_time, size: 16, color: Colors.grey),
                      const SizedBox(width: 6),
                      Text(
                        '${widget.duration ?? 0} min',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),

                  /// Difficulty
                  Row(
                    children: [
                      const Icon(
                        Icons.local_fire_department,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        widget.difficulty ?? '',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// RIGHT BUTTON
            if (widget.showButton) const SizedBox(width: 12),

            if (widget.showButton)
              ElevatedButton(
                onPressed:
                    ref.watch(
                      completeWorkoutProvider.select(
                        (state) => state.loadingWorkoutId == widget.workout_id,
                      ),
                    )
                    ? null
                    : () async {
                        await ref
                            .read(completeWorkoutProvider.notifier)
                            .completeWorkout(workoutId: widget.workout_id);
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightGreen,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  minimumSize: const Size(0, 32),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child:  const Text(
                        "Mark\nComplete",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
