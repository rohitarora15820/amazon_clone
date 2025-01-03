const express = require("express");
const auth = require("../middleware/auth");
const productModel = require("../models/product_model");
const productRouter = express.Router();

// get product based  on Category
// ?category => req.query.category 
// :category => req.params.category
productRouter.get("/api/products", auth, async (req, res) => {
    try {
      const products = await productModel.find({category: req.query.category});
      res.status(200).json(products);
    } catch (e) {
      res.status(500).json({ error: e.message });
    }
  });

module.exports = productRouter;