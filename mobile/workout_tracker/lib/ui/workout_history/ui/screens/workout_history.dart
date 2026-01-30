import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_tracker/ui/work_streak/ui/widgets/streak_section.dart';

import '../../../work_streak/provider/workout_streak_notifier.dart';
import '../../../work_streak/ui/widgets/streak_card.dart';
import '../../provider/workout_history_notifier.dart';
import '../widgets/work_history_card.dart';

class WorkoutHistoryScreen extends ConsumerStatefulWidget {
  const WorkoutHistoryScreen({super.key});

  @override
  ConsumerState<WorkoutHistoryScreen> createState() =>
      _WorkoutHistoryScreenState();
}

class _WorkoutHistoryScreenState
    extends ConsumerState<WorkoutHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(workoutHistoryProvider.notifier).fetchWorkouts();
    });
    Future.microtask(() {
      ref.read(workoutStreakProvider.notifier).fetchWorkoutStreak();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(workoutHistoryProvider);

    if (state.isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Scaffold(
        body: Center(child: Text(state.error!)),
      );
    }

    final history = state.workoutHistory ?? [];

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // 🔹 Header
              Text(
                'Workout History',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 12.h),

              // 🔥 Streak Card
              StreakSection(),

              SizedBox(height: 20.h),

              // 🔹 History List
              Expanded(
                child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    final item = history[index];
                    return WorkoutHistoryCard(item: item);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


