const mongoose=require('mongoose');

const userSchema=mongoose.Schema({
      name:{
        type:String,
        required:true,
        trim:true,
      },
      email: {
        required: true,
        type: String,
        trim: true,
        validate: {
          validator: (value) => {
            const re =
              /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
            return value.match(re);
          },
          message: "Please enter a valid email address",
        },
      },
      password:{
        type:String,
        required:true,
        minlength:6,
        trim:true,
    
      },

      type:{
        type:String,
        default:"user"
      },
      address:{
        type:String,
        default:""

      }
});

const UserModel=mongoose.model("User",userSchema);

module.exports=UserModel;