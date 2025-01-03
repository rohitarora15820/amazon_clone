const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const app = express();
const PORT = 3000;
const DB="mongodb+srv://rohitarora15820:bW2qlhrYtFkBnny4@cluster0.xuh66.mongodb.net/amazon_clone";

// middleware routes
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);


mongoose
  .connect(DB)
  .then(() => {    
    console.log("Connected to MongoDB");
  })
  .catch((err) => console.error("Error connecting to MongoDB", err));

app.listen(PORT,"0.0.0.0", () => {
  console.log(`Server is running on port ${PORT}`);
  console.log("Press Ctrl + C to stop the server");
});
