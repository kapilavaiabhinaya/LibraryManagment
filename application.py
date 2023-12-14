from bottle import route, post, run, template, redirect, request
import database

database.set_up_database()

# Task routes
@route("/")
def get_tasks():
    tasks = database.get_tasks()
    return template("list_task.tpl", tasks=tasks)

@route("/tasks/add")
def get_add_task():
    categories = database.get_task_categories()
    return template("add_task.tpl", categories=categories)

@post("/tasks/add")
def post_add_task():
    title = request.forms.get("title")
    description = request.forms.get("description")
    category_id = request.forms.get("category_id")
    database.add_task(title, description, category_id)
    redirect("/")

@route("/tasks/update/<id>")
def get_update_task(id):
    task = database.get_task(id)
    categories = database.get_task_categories()
    category_id = task.category.id if task.category else ''
    return template("update_task.tpl", task=task, categories=categories, category_id=category_id)

@post("/tasks/update")
def post_update_task():
    title = request.forms.get("title")
    description = request.forms.get("description")
    id = request.forms.get("id")
    category_id = request.forms.get("category_id")
    database.update_task(id, title, description, category_id)
    redirect("/")

@route("/tasks/delete/<id>")
def get_delete_task(id):
    database.delete_task(id)
    redirect("/")

# Task Category routes
@route("/task-categories")
def get_task_categories():
    query = request.query.get("query")
    if query:
        categories = database.get_filtered_task_categories(query)
    else:
        categories = database.get_task_categories()
        query = ''
    return template("list_task_category.tpl", categories=categories, query=query)

@route("/task-categories/add")
def get_add_task_category():
    return template("add_task_category.tpl")

@post("/task-categories/add")
def post_add_task_category():
    name = request.forms.get("name")
    database.add_task_category(name)
    redirect("/task-categories")

@route("/task-categories/update/<id>")
def get_update_task_category(id):
    category = database.get_task_categories(id)[0]
    return template("update_task_category.tpl", category=category)

@post("/task-categories/update")
def post_update_task_category():
    name = request.forms.get("name")
    id = request.forms.get("id")
    database.update_task_category(id, name)
    redirect("/task-categories")

@route("/task-categories/delete/<id>")
def get_delete_task_category(id):
    database.delete_task_category(id)
    redirect("/task-categories")

run(host='localhost', port=8080)
