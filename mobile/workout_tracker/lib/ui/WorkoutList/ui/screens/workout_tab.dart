import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../complete_workout/provider/complete_workout_notifier.dart';
import '../../../complete_workout/provider/complete_workout_state.dart';
import '../../../theme/Dialogue.dart';
import '../../../work_streak/provider/workout_streak_notifier.dart';
import '../../provider/workout_notifier.dart';
import '../widgets/workout_widget.dart';

class WorkoutsTab extends ConsumerStatefulWidget {
  const WorkoutsTab({super.key});

  @override
  ConsumerState<WorkoutsTab> createState() => _WorkoutsTabState();
}

class _WorkoutsTabState extends ConsumerState<WorkoutsTab> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(workoutProvider.notifier).fetchWorkouts();
    });
        }
  @override
  Widget build(BuildContext context) {
    ref.listen<CompleteWorkoutState>(
        completeWorkoutProvider,
            (previous, next) {
          if (next.error != null && previous?.error != next.error) {
            BotToast.showText(text: next.error!);
          }
          if (next.data != null && previous?.data != next.data) {
            showWorkoutCompletedDialog(
              context,
              title: next.data!.message ?? "Workout completed",
              streak: next.data!.streak ?? 0,
            );
          }
        });
    final state = ref.watch(workoutProvider);
    final streakCount = ref.watch(workoutStreakProvider);
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (state.error != null) {
      return Center(child: Text(state.error!));
    }

    final workouts = state.workouts ?? [];

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h),

            // 🔹 Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Workouts',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // 🔹 Greeting
            Text(
              'Hello, Mark! ✌️',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 12.h),

            // 🔥 Streak Card
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 24.w,
                  vertical: 12.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8A00), Color(0xFFFF5252)],
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.local_fire_department,
                        color: Colors.white),
                    SizedBox(width: 8.w),
                    Text(
                      '${streakCount.data!.streak}  days streak',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 24.h),

            // 🔹 Workout List
            Expanded(
              child: ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  final w = workouts[index];
                  return WorkoutCard(
                    workout_id:w.id,
                    title: w.title,
                    duration: w.durationMinutes,
                    difficulty: w.difficulty,
                     description: w.description,
                    showButton: true,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }


}
