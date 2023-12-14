<!DOCTYPE html>
<html>
<head>
    <title>Add Task</title>
</head>
<body>

<h2>Add Task</h2>

<form action="/tasks/add" method="post">
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" rows="4" required></textarea><br>

    <label for="category_id">Category:</label>
    <select id="category_id" name="category_id">
        <option value="">Select a category</option>
        % for category in categories:
            <option value="{{ category.id }}">{{ category.name }}</option>
        % end
    </select><br>

    <!-- Add more fields as needed, depending on your task entity -->

    <input type="submit" value="Add Task">
</form>

<p><a href="/">Back to Task List</a></p>

</body>
</html>
