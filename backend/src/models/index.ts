import User from "./user";
import Workout from "./Workout";
import UserWorkout from "./UserWorkout";

/* Associations */
User.belongsToMany(Workout, {
  through: UserWorkout,
  foreignKey: "user_id",
});

Workout.belongsToMany(User, {
  through: UserWorkout,
  foreignKey: "workout_id",
});

export { User, Workout, UserWorkout };
