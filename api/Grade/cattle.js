var express = require('express');
var router = express.Router();
var firebase = require('../../firebase.js');

router.post('/add',(req, res)=>{
    var data = req.body;
    firebase.db().ref('cattle').push(data).then(data=>{
        res.json('Sucess');
    }, err=>{
        res.json('Failed');
    })
})

router.delete('/remove/:key',(req, res)=>{
    var key = req.params.key;
    firebase.db().ref('cattle/'+key).remove();
})

router.post('/addform',(req, res)=>{
    var data = req.body;
    firebase.db().ref('cattle').push(data);
})

router.get('/show',(req, res)=>{
    firebase.db().ref('cattle').once('value',data=>{
        res.json(data.val());
    });
});

router.post('/edit/:key',(req, res)=>{
    var key = req.params.key;
    var data = req.body;
    firebase.db().ref('cattle/'+key).update(data);
})

router.get('/show/:key',(req, res)=>{
    var key = req.params.key;
    firebase.db().ref('cattle/').orderByKey().equalTo(key).once('value',data=>{
        res.json(data.val());
    });
});



module.exports = router;
