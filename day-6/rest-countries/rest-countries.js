// Rest countries:

var json = require('./rest-countries-data.json');


// Get the countries in asia - filter

let asia = json.data.filter((a) => a.region == "Asia")

// console.log(asia)


// Get the countries with population less than 2L - fliter

let population = json.data.filter((p) => p.population < 200000)

// console.log(population)


// Bumpup the current population of all the counteirs by 1L - Map

let addPopulation = json.data.map((ap) => ap.population += 100000)

// console.log(addPopulation)


// convert all the names in capital - map

let nameCapital = json.data.map((nc) => nc.name.toUpperCase())

// console.log(nameCapital)


// print following details name , capital , flag - foreach & filter

let details = json.data.map((x) =>  [x.name, x.capital, x.flag]) // tried a lot with foreach & filter. Didn't got it...

// console.log(details)


// Print the total population of the countries - reduce

let totalPopulation = json.data.reduce((total, country) => total + country.population, 0)

// console.log(totalPopulation)


// Print the total population of the countries in asia - filter & reduce

let asiaPopulation = json.data.filter((reg) => reg.region == "Asia").reduce((total, country) => total + country.population, 0)

// console.log(asiaPopulation)