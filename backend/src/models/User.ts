import { DataTypes, Model } from "sequelize";
import sequelize from "../config/database";
import Workout from "./Workout";
import UserWorkout from "./UserWorkout";

class User extends Model {
  public id!: number;
  public name!: string;
  public email!: string;
}

User.init(
  {
    id: {
      type: DataTypes.INTEGER,
      autoIncrement: true,
      primaryKey: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      allowNull: false,
      unique: true,
    },
  },
  {
    sequelize,
    tableName: "users",
    timestamps: true,
    createdAt: "created_at",
    updatedAt: false,
  }
);

/* MANY-TO-MANY RELATION */
User.belongsToMany(Workout, {
  through: UserWorkout,
  foreignKey: "user_id",
  otherKey: "workout_id",
});

export default User;
