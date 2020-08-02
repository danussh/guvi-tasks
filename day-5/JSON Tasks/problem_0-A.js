let cat = {
    name: "Fluffy",
    activities: ["play", "eat cat food"],
    catFriends: [
        {
            name: "bar",
            activities: ["be grumpy", "eat bread omblet"],
            weight: 8,
            furcolor: "white",
        },
        {
            name: "foo",
            activities: ["sleep", "pre-sleep naps"],
            weight: 3,
        },
    ],
};

// console.log(cat);

// 1. Add height and weight to Fluffy

cat.height = 30;
cat.weight = 5;

// 2. Fluffy name is spelled wrongly. Update it to Fluffyy

cat.name = "Fluffyy";

// 3. List all the activities of Fluffyy’s catFriends.

let output = [];
for (let friend in cat.catFriends) {
    output.push(...cat.catFriends[friend].activities);
}
console.log("Activities of catFriends : " + output);

// 4. Print the catFriends names.

output = [];
for (let friend in cat.catFriends) {
    output.push(cat.catFriends[friend].name);
}
console.log("CatFriends names : " + output);

// 5. Print the total weight of catFriends

let weight = cat.weight;
for (let friend in cat.catFriends) {
    weight += cat.catFriends[friend].weight;
}
console.log("Weight : " + weight);

// 6. Print the total activities of all cats (op:6)

output = [...cat.activities];
for (let friend in cat.catFriends) {
    output.push(...cat.catFriends[friend].activities);
}
console.log("Activities of all cats : " + output);

// 7. Add 2 more activities to bar & foo cats

for (let friend in cat.catFriends) {
    cat.catFriends[friend].activities.push("scraching", "chasing rats");
}

// 8. Update the fur color of bar

cat.catFriends[0].furcolor = "brown";
