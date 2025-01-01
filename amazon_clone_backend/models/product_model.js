const mongoose=require('mongoose');

const productSchema= mongoose.Schema({
      name:{
        type:String,
        trim:true,
        required:true,
      },
      description:{
        type:String,
        trim:true,
        required:true,
      },
      images:[
        {
            type:String,
            required:true,
        }
      ],
      quantity:{
        type:Number,
        required:true,
      },
      price:{
        type:Number,
        required:true,
      },
      category:{
        type:String,
        trim:true,
        required:true,
      }

});

const productModel= mongoose.model('Product',productSchema);
module.exports= productModel;