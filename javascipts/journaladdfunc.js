/*A function that adds days(objects) to the journal by pushing them. This can be done as the journal is actually just an array of different objects */
var journal = [];

function addEntry(events, Squirrelness){
    journal.push({
            events: events,
            squirrel: squirrelness
    });
}

addEntry(["work","ice cream", "lasagna","brushed teeth"], false);
