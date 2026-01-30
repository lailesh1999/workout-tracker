import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data_models/workout.dart';
import '../../../complete_workout/provider/complete_workout_notifier.dart';
import '../../../complete_workout/provider/complete_workout_state.dart';
import '../../../theme/Dialogue.dart';
import '../widgets/description.dart';
import '../widgets/header.dart';

class WorkoutDetailScreen extends ConsumerStatefulWidget {
  final Workout workout;

  const WorkoutDetailScreen({
    super.key,
    required this.workout,
  });

  @override
  ConsumerState<WorkoutDetailScreen> createState() =>
      _WorkoutDetailScreenState();
}

class _WorkoutDetailScreenState
    extends ConsumerState<WorkoutDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<CompleteWorkoutState>(
      completeWorkoutProvider,
          (previous, next) {
        if (next.error != null && previous?.error != next.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(next.error!)),
          );
        }
        if (next.data != null && previous?.data != next.data) {
          showWorkoutCompletedDialog(
            context,
            title: next.data!.message ?? "Workout completed",
            streak: next.data!.streak ?? 0,
          );

        }
      },
    );
    final isButtonLoading = ref.watch(
      completeWorkoutProvider.select((state) => state.isLoading),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("WorkOut Details", style: TextStyle(
          fontSize: 22.sp,
          fontWeight: FontWeight.bold,
        )),
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderSection(workout: widget.workout),

            const SizedBox(height: 20),

            DescriptionSection(description: widget.workout.description.toString()),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: isButtonLoading
                      ? null
                      : () async {
                    await ref
                        .read(
                        completeWorkoutProvider.notifier)
                        .completeWorkout(
                      workoutId: widget.workout.id,
                    );
                  },
                  child: isButtonLoading
                      ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : const Text(
                    "Mark Complete",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
