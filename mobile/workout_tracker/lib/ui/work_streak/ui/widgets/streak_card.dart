import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/data_models/workour_history.dart';
import '../../../../core/data_models/worout_streak.dart';
import '../../../../core/utils/date_format_helper.dart';

class StreakCard extends StatelessWidget {
  final WorkoutStreak streak;

  const StreakCard({required this.streak});

  @override
  Widget build(BuildContext context) {
    final streakDays = streak.streak ?? 0;
    final lastWorkoutDate = streak.lastWorkoutDate;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.withOpacity(0.15),
            ),
            child: const Icon(
              Icons.local_fire_department,
              color: Colors.orange,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "🔥 $streakDays day streak!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  lastWorkoutDate != null
                      ? "Last workout on ${formatDate(lastWorkoutDate)}"
                      : "Start today to build a new streak!",
                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

