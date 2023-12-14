<!DOCTYPE html>
<html>
<head>
    <title>Update Task</title>
</head>
<body>

<h2>Update Task</h2>

<form action="/tasks/update" method="post">
    <input type="hidden" name="id" value="{{ task.id }}">

    <label for="title">Title:</label>
    <input type="text" id="title" name="title" value="{{ task.title }}" required><br>

    <label for="description">Description:</label>
    <textarea id="description" name="description" rows="4" required>{{ task.description }}</textarea><br>

    <label for="category_id">Category:</label>
    <select id="category_id" name="category_id">
        <option value="">Select a category</option>
        % for category in categories:
            <option value="{{ category.id }}" % if category.id == category_id: selected="selected" % end>{{ category.name }}</option>
        % end
    </select><br>

    <input type="submit" value="Update Task">
</form>

<p><a href="/">Back to Task List</a></p>

</body>
</html>
