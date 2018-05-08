var map = {};

function StorePhi(event, phi){
map[event]= phi;
}

storePhi("pizza", 0.068);
storePhi("touched tree", -0.081);

for(var event in map) {
console.log("The correlation for"+ event + "is" + map[event]);
}
