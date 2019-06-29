
/*
//455
const Gamedig = require('gamedig');
Gamedig.query({
    type: 'arkse',
    host: '85.190.158.66',
	maxAttempts: '3',
	//port: '80',
	//port: '27015',
	port: '27017',
	debug: true
}).then((state) => {
	//console.log(error);
    console.log(state);
}).catch((error) => {
	//console.log(error);
    console.log("Server is offline");
});
*/

/*
//42
const Gamedig = require('gamedig');
Gamedig.query({
    type: 'arkse',
    host: '85.190.158.66',
	maxAttempts: '3',
	//port: '80',
	//port: '27015',
	port: '27019',
	debug: true
}).then((state) => {
	//console.log(error);
    console.log(state);
}).catch((error) => {
	//console.log(error);
    console.log("Server is offline");
});
*/

var lol = 27000
var end  = 27050

while(lol<end){
	console.log("lol:"+lol)
	lol ++
	
	const Gamedig = require('gamedig');
	Gamedig.query({
		type: 'arkse',
		host: '85.190.158.66',
		//maxAttempts: '3',
		//port: '80',
		//port: '27015',
		port: lol/*l,
		debug: true*/
	}).then((state) => {
		//console.log(error);
		console.log(state);
	}).catch((error) => {
		//console.log(error);
		console.log("Server is offline");
	});
}