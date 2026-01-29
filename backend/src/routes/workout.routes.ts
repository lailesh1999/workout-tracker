import { Router } from "express";
import Workout from "../models/Workout";

const router = Router();

router.get("/workouts", async (_, res) => {
  const workouts = await Workout.findAll();
  res.json(workouts);
});

export default router;
