const express= require('express');
const admin = require('../middleware/admin');
const productModel = require('../models/product_model');

const adminRouter = express.Router();

// add product

adminRouter.post('/admin/add-products', admin, async (req,res)=>{
    try{
    const {name,description,images,quantity,price,category} =req.body;
    // add product to database
    let product=new productModel({
        name,
        description,
        images,
        quantity,
        price,
        category
    });

    product = await product.save();
    res
    .status(200)
    .json({ message: "Product created successfully", data: product });

    }catch(err){
        res.status(500).json({error:err.message});
    }
});

module.exports = adminRouter;