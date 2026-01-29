import app from "./app";
import sequelize from "./config/database";
import dotenv from "dotenv";
import "./models"; // LOAD MODELS + ASSOCIATIONS FIRST

dotenv.config();


sequelize.sync().then(() => {
  app.listen(process.env.PORT, () => {
    console.log("Server running on port", process.env.PORT);
  });
});