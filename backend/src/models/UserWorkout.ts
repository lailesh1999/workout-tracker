import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database";

class UserWorkout extends Model {
  public id!: number;
  public user_id!: number;
  public workout_id!: number;
  public completed_at!: Date;
}

UserWorkout.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    user_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    workout_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    completed_at: {
      type: DataTypes.DATE,
      allowNull: false,
    },
  },
  {
    sequelize,
    tableName: "user_workouts",
    timestamps: false,
  }
);

export default UserWorkout;
