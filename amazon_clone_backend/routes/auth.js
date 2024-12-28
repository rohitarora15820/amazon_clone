const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const UserModel = require("../models/user_model");

const authRouter = express.Router();

// SignUp API
authRouter.post("/api/signUp", async (req, res) => {
  try {
    const { name, email, password } = req.body;

    const existingUser = await UserModel.findOne({ email });

    if (existingUser) {
      return res.status(400).json({ message: "User already exists" });
    }

    const hashPassword = await bcryptjs.hash(password, 8);

    let newUser = UserModel({
      name,
      email,
      password: hashPassword,
    });

    newUser = await newUser.save();

    res
      .status(200)
      .json({ message: "User created successfully", data: newUser });
  } catch (e) {
    res.status(500).json({
      error: e.message,
    });
  }
});

// Sign in API
authRouter.post("/api/signIn", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user =await UserModel.findOne({ email });

    if (!user) {
      return res
        .status(400)
        .json({ message: "User with this email doesn't Exists!" });
    }

    const isMatchPassword = await bcryptjs.compare(password, user.password);

    if (!isMatchPassword) {
      return res.status(400).json({ message: "Password doesn't Match" });
    }

    const token = jwt.sign({ id: user._id }, "passwordKey");

    res.json({ token, ...user._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
