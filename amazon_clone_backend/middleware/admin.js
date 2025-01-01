const jwt = require("jsonwebtoken");
const UserModel = require("../models/user_model");

const admin = async (req, res, next) => {
  try {
    const token = req.header("x-auth-token");

    if (!token) {
      return res
        .status(401)
        .json({ message: "Invalid token provided in request body" });
    }

    const verified = jwt.verify(token, "passwordKey");

    if (!verified) {
      return res.status(401).json({ message: "Token is invalid" });
    }

    const user = await UserModel.findById(verified.id);
    if (user.type == "user" || user.type == "seller") {
      return res
        .status(403)
        .json({
          message:
            "Access denied, only admin can access! Please try again later",
        });
    }

    req.user = verified.id;
    req.token = token;
    next();
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

module.exports = admin;
