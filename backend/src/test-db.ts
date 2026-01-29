import sequelize from "./config/database";

sequelize.authenticate()
  .then(() => console.log("✅ XAMPP MySQL connected"))
  .catch(err => console.error("❌ DB error:", err));
