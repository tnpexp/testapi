var app = require('express')();
var body = require('body-parser');

app.use(body.json());
app.use(body.urlencoded({extended:false}));

var header = function(req, res ,next){
    res.header("Access-Control-Allow-Origin","*");
    res.header(
        "Access-Control-Allow-Headers",
        "Origin, X-Requested-With, Content-Type, Accept, ",
    );
    res.header("Access-Control-Allow-Methods", "GET, POST, OPTIONS, PUT, DELETE");
    next();
};

// ----------------------------------------------------------------------------------

app.use('/api/user', header, require('./api/Grade/user.js'));
app.use('/api/cattle', header, require('./api/Grade/cattle.js'));
app.use('/api/graded', header, require('./api/Grade/graded.js'));
app.use('/api/summed', header, require('./api/Grade/summed.js'));

// ----------------------------------------------------------------------------------

app.use('*',(req, res)=>{
    res.json('hello');
})

app.listen(4000, ()=>{
    console.log('Starting port 4000..');
})

