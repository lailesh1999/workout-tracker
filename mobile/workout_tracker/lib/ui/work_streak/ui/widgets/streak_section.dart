import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_tracker/ui/work_streak/ui/widgets/streak_card.dart';

import '../../../workout_history/provider/workout_history_notifier.dart';
import '../../provider/workout_streak_notifier.dart';
import '../shimmer_effect/streak_card_shimmer.dart';

class StreakSection extends ConsumerWidget {
  const StreakSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streakState = ref.watch(workoutStreakProvider);

    if (streakState.isLoading) {
      return const StreakCardShimmer();
    }

    if (streakState.error != null || streakState.data == null) {
      return const SizedBox.shrink();
    }

    return StreakCard(streak: streakState.data!);
  }
}

