<!DOCTYPE html>
<html>
<head>
    <title>Add Task Category</title>
</head>
<body>

<h2>Add Task Category</h2>

<form action="/task-categories/add" method="post">
    <label for="name">Category Name:</label>
    <input type="text" id="name" name="name" required><br>

    <input type="submit" value="Add Task Category">
</form>

<p><a href="/task-categories">Back to Task Categories</a></p>

</body>
</html>
