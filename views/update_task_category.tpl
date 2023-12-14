<!DOCTYPE html>
<html>
<head>
    <title>Update Task Category</title>
</head>
<body>

<h2>Update Task Category</h2>

<form action="/task-categories/update" method="post">
    <input type="hidden" name="id" value="{{category.id if category else '' }}">

    <label for="name">Category Name:</label>
    <input type="text" id="name" name="name" value="{{ category.name if category else '' }}" required><br>

    <input type="submit" value="Update Task Category">
</form>

<p><a href="/task-categories">Back to Task Categories</a></p>

</body>
</html>
