/*A function to generate the correlation bw two independent variables. The tables array must contain the values in such a way :-
  table[0],i.e, 00- no pizza + no squirrel
  table[2],i.q, 10- pizza + no squirrel
 The value returned can then tell us the correlation bw the turning into a squirrel and the variable of our choice. 
 * */
function phi(table) {
    return(table[3] * table[0] - table[2] * table[1])/ Math.sqrt((table[2]+table[3]) * (table[0]+ table[1])* (table[1]+ table[3])* (table[0] + table[2]));
}
