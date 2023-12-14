<!DOCTYPE html>
<html>
<head>
    <title>Task List</title>
</head>
<body>

<h2>Task List</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Description</th>
        <th>Category</th>
        <th>Actions</th>
    </tr>
    % for task in tasks:
        <tr>
            <td>{{ task.id }}</td>
            <td>{{ task.title }}</td>
            <td>{{ task.description }}</td>
            <td>{{ task.category.name if task.category else '' }}</td>
            <td>
                <a href="/tasks/update/{{ task.id }}">Edit</a>
                <a href="/tasks/delete/{{ task.id }}" onclick="return confirm('Are you sure you want to delete this task?')">Delete</a>
            </td>
        </tr>
    % end
</table>

<p><a href="/tasks/add">Add New Task</a></p>

</body>
</html>
