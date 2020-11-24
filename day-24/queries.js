// 1

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

// 2

db.company_drives.find({
    attended_date: {
        $gt: ISODate("2020-10-15"),
        $lt: ISODate("2020-10-31"),
    },
});

// 3

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

// 4

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

// 5

db.mentors.find({ mentee_count: { $gt: 15 } }, { _id: 0 });

// 6

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
