var firebase = require('firebase');

var config = {
    apiKey: 'AIzaSyBLHIby79KyIPP19fYLgD3vXKzLvZltpMk',
    authDomain: 'beefproject-89e7c.firebaseapp.com',
    databaseURL: 'https://beefproject-89e7c.firebaseio.com',
    projectId: 'beefproject-89e7c',
    storageBucket: 'beefproject-89e7c.appspot.com',
    messagingSenderId: '497109692041'
  };
  firebase.initializeApp(config);

  exports.db = function(){
      return firebase.database();
  }