import { Router } from "express";
import UserWorkout from "../models/UserWorkout";
import { calculateStreak } from "../utils/streak";

const router = Router();

/* Workout History */
router.get("/users/:userId/workout-history", async (req, res) => {
  const data = await UserWorkout.findAll({
    where: { user_id: req.params.userId },
    order: [["completed_at", "DESC"]],
  });
  res.json(data);
});

/* Complete Workout */
router.post(
  "/users/:userId/workouts/:workoutId/complete",
  async (req, res) => {
    try {
      const { userId, workoutId } = req.params;
      const { completedAt } = req.body;

      if (!completedAt) {
        return res.status(400).json({ error: "completedAt required" });
      }

      // ✅ Insert completion
      await UserWorkout.create({
       user_id: Number(userId),
       workout_id: Number(workoutId),
       completed_at: new Date(completedAt), 
      });

      // ✅ Fetch completed workouts (DESC)
      const workouts = await UserWorkout.findAll({
        where: { user_id: Number(userId) },
        order: [["completed_at", "DESC"]],
      });

      // ✅ Calculate streak
      const streak = calculateStreak(
        workouts.map(w => w.getDataValue("completed_at"))
      );

      res.status(201).json({
        message: "Workout completed",
        streak,
      });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "Failed to complete workout" });
    }
  }
);

/* Get Streak */
router.get("/users/:userId/streak", async (req, res) => {
  const workouts = await UserWorkout.findAll({
    where: { user_id: req.params.userId },
    order: [["completed_at", "DESC"]],
  });

  const streak = calculateStreak(workouts.map(w => w.getDataValue("completed_at")));

  res.json({
    streak,
    lastWorkoutDate: workouts[0]?.getDataValue("completed_at") || null
  });
});

export default router;
