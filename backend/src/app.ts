import express from "express";
import workoutRoutes from "./routes/workout.routes";
import userRoutes from "./routes/user.routes";
import "./models";

const app = express();
app.use(express.json());

app.use("/api", workoutRoutes);
app.use("/api", userRoutes);

export default app;
