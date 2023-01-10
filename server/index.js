const express = require("express");
const mongoose = require("mongoose")
const app = express();
const PORT = 3000;
const DB = "mongodb+srv://nazmullflutter:165257As$@cluster0.n00nfml.mongodb.net/?retryWrites=true&w=majority";
const authRouter = require('./routes/auth.js');
//middleware
app.use(express.json());
app.use(authRouter);

//connection mongoose
mongoose.connect(DB).then(() => {
    console.log("connection succesfully!");
}).catch(e => {
    console.log(`errror ${e}`);
})




//listing
app.listen(PORT, function () {
    console.log(`connected at port ${PORT} `);
});