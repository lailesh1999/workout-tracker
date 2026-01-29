export function calculateStreak(dates: Date[]): number {
  let streak = 0;
  let today = new Date();
  today.setHours(0, 0, 0, 0);

  for (const d of dates) {
    const workoutDate = new Date(d);
    workoutDate.setHours(0, 0, 0, 0);

    const diff =
      (today.getTime() - workoutDate.getTime()) /
      (1000 * 60 * 60 * 24);

    if (diff === 0 || diff === 1) {
      streak++;
      today.setDate(today.getDate() - 1);
    } else {
      break;
    }
  }
  return streak;
}
