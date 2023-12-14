<!DOCTYPE html>
<html>
<head>
    <title>Task Categories</title>
</head>
<body>

<h2>Task Categories</h2>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Actions</th>
    </tr>
    % for category in categories:
        <tr>
            <td>{{ category.id }}</td>
            <td>{{ category.name }}</td>
            <td>
                <a href="/task-categories/update/{{ category.id }}">Edit</a>
                <a href="/task-categories/delete/{{ category.id }}" onclick="return confirm('Are you sure you want to delete this category?')">Delete</a>
            </td>
        </tr>
    % end
</table>

<p><a href="/task-categories/add">Add New Task Category</a></p>

</body>
</html>
