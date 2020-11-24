## Design database for Zen class program :

---

### [users](collections/users.json)
### [codekata](collections/codekata.json)
### [attendance](collections/attendance.json)
### [topics](collections/topics.json)
### [tasks](collections/tasks.json)
### [company_drives](collections/company_drives.json)
### [mentors](collections/mentors.json)

---

### 1. Find all the topics and tasks which are thought in the month of October
```
db.topics.aggregate([
    {
        $lookup: {
            from: "tasks",
            localField: "topic_id",
            foreignField: "task_id",
            as: "task",
        },
    },
    {
        $match: {
            date: { $regex: /202010/ },
        },
    },
    { $unwind: "$task" },
    {
        $project: {
            _id: 0,
            topic_name: "$topic_name",
            task_name: "$task.task",
        },
    },
]);
```

### 2. Find all the company drives which appeared between 15 oct-2020 and 31-oct-2020
```
db.company_drives.find({
    attended_date: {
        $gt: ISODate("2020-10-15"),
        $lt: ISODate("2020-10-31"),
    },
});
```

### 3. Find all the company drives and students who are appeared for the placement
```
db.company_drives.aggregate([
    {
        $lookup: {
            from: "users",
            localField: "company_id",
            foreignField: "id",
            as: "students_attended",
        },
    },
    { $unwind: "$students_attended" },
    {
        $project: {
            _id: 0,
            company_name: "$company_name",
            student_name: "$students_attended.username",
        },
    },
]);
```

### 4. Find the number of problems solved by the user in codekata
```
db.users.aggregate([
    {
        $lookup: {
            from: "codekata",
            localField: "id",
            foreignField: "user_id",
            as: "codekata",
        },
    },
    { $unwind: "$codekata" },
    {
        $project: {
            _id: 0,
            username: "$username",
            problems_solved: "$codekata.problems_solved",
        },
    },
]);
```

### 5. Find all the mentors with who has the mentee's count more than 15
```
db.mentors.find({ mentee_count: { $gt: 15 } }, { _id: 0 });
```

### 6. Find the number of users who are absent and task is not submitted  between 15 oct-2020 and 31-oct-2020
```
db.attendance.aggregate([
    { $unwind: "$dates_absent" },
    // { $range: [ISODate("2020-10-15"), ISODate("2020-10-31"), "$dates_absent"] },
    {
        $match: {
            dates_absent: {
                $gt: ISODate("2020-10-15"),
                $lt: ISODate("2020-10-31"),
            },
        },
    },
    { $group: { _id: "$user_id", count: { $sum: 1 } } },
    { $count: "absent_user_count" },
]);
```
### See the query outputs [here](query_outputs)...