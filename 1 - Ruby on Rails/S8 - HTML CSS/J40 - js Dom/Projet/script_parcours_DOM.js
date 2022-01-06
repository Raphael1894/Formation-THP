//const prompt = require('prompt-sync')();

//count p
elementsToBeCounted = document.getElementsByTagName('p'); console.log(Object.keys(elementsToBeCounted).length)

//find coucou
elementCoucou = document.getElementById("coucou"); console.log(elementCoucou)

//troisième <a>
elementA = document.getElementsByTagName("a"); console.log(elementA[2]); 

//count compte-moi
//elementCount = document.getElementsByTagName("li").innerHTML = document.getElementsByClassName('compte-moi').length; console.log(elementCount)
elementCount = document.querySelectorAll('li .compte-moi').innerHTML; console.log(elementCount)