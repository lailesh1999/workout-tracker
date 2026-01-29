export function calculateStreak(dates: Date[]): number {
  if (!dates || dates.length === 0) return 0;

  let streak = 0;

  // Start from today (normalized)
  let currentDay = new Date();
  currentDay.setHours(0, 0, 0, 0);

  for (const date of dates) {
    const workoutDay = new Date(date);
    workoutDay.setHours(0, 0, 0, 0);

    const diffDays =
      (currentDay.getTime() - workoutDay.getTime()) /
      (1000 * 60 * 60 * 24);

    if (diffDays === 0 || diffDays === 1) {
      streak++;
      // Move expected day back by one
      currentDay.setDate(currentDay.getDate() - 1);
    } else {
      break; // streak broken
    }
  }

  return streak;
}
