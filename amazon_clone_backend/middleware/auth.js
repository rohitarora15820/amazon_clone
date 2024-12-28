const jwt =require('jsonwebtoken');

const auth =async (req,res,next)=>{
try{
    const token = req.header("x-auth-token");

    if (!token) {
      return res.status(401).json({message:"No auth token found. Access denied."});
    }

    const verified = jwt.verify(token, "passwordKey");

    if (!verified) return res.status(401).json({message:"Authentication failed"});

    req.user = verified.id;
    req.token = token;
    next();

}catch(err){
    
    res.status(500).json({error: err.message});
}
}


module.exports = auth;