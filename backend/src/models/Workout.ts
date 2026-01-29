import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database";
import User from "../models/user";
import UserWorkout from "./UserWorkout";

class Workout extends Model {
  public id!: number;
  public title!: string;
  public description!: string;
  public duration_minutes!: number;
  public difficulty!: "Beginner" | "Intermediate" | "Advanced";
}

Workout.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    title: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
    },
    duration_minutes: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    difficulty: {
      type: DataTypes.ENUM("Beginner", "Intermediate", "Advanced"),
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "workouts",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: false,
  }
);

/* MANY-TO-MANY RELATION */
Workout.belongsToMany(User, {
  through: UserWorkout,
  foreignKey: "workout_id",
  otherKey: "user_id",
});

export default Workout;
