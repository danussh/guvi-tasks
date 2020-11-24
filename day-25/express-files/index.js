const express = require('express');
const fs = require('fs');

const app = express();

app.listen(3000, () => console.log("http://localhost:3000/list"));

app.use('/images', express.static('./day-25/express-files/images'))

// app.get("/", (request, response) => {
//     response.send("home route")
// });

app.get("/list", (request, response) => {
    fs.readdir("./", "utf-8", (err, data) => {
        if (err) throw err;
        let result = " ";
        data.forEach((elem) => {
            if(fs.lstatSync(`./${elem}`).isDirectory()){
                img = '<img src="images/folder.png" width="32px" style="position:relative; top:10px;">'
            }else{
                img = '<img src="images/file.png" width="32px" style="position:relative; top:10px;">'
            }
            result += `${img} ${elem}<br><br>`
        })
        response.send(result)
    })
});