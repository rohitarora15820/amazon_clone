const express = require("express");
const admin = require("../middleware/admin");
const productModel = require("../models/product_model");

const adminRouter = express.Router();

// add product
adminRouter.post("/admin/add-products", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    // add product to database
    let product = new productModel({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });

    product = await product.save();
    res
      .status(200)
      .json({ message: "Product created successfully", data: product });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

// get all products
adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await productModel.find({});
    res.status(200).json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// delete products By Id
adminRouter.post('/admin/delete-products',admin, async(req,res)=>{
    try{
        const {id} = req.body;
        const product = await productModel.findByIdAndDelete(id);
        if(!product){
            return res.status(404).json({message: 'Product not found'});
        }
        res.status(200).json({message: 'Product deleted successfully', data: product});
    }catch(e){
        res.status(500).json({error: e.message});
    }
});

module.exports = adminRouter;
