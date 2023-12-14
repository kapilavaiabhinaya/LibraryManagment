from peewee import *

db = SqliteDatabase('your_database.db')
db.connect()

class TaskCategory(Model):
    name = CharField()
    class Meta:
        database = db 

class Task(Model):
    title = CharField()
    description = TextField()
    category = ForeignKeyField(TaskCategory, backref='tasks', null=True)
    class Meta:
        database = db 

def set_up_database():
    db.drop_tables([TaskCategory, Task], safe=True)
    db.create_tables([TaskCategory, Task])

def get_task_categories(id=None):
    if id is None:
        categories = TaskCategory.select()
    else:
        categories = TaskCategory.select().where(TaskCategory.id == id)
    return categories

def add_task_category(name):
    category = TaskCategory(name=name)
    category.save()

def update_task_category(category_id, name):
    try:
        category = TaskCategory.get(TaskCategory.id == category_id)
        category.name = name
        category.save()
        return True
    except DoesNotExist:
        return False

def delete_task_category(category_id):
    try:
        category = TaskCategory.get(TaskCategory.id == category_id)
        category.delete_instance()
        return True
    except DoesNotExist:
        return False
        
def get_tasks(id=None):
    if id is None:
        tasks = Task.select()
    else:
        tasks = Task.select().where(Task.id == id)
    return tasks

def add_task(title, description, category_id=None):
    task = Task(title=title, description=description, category=category_id)
    task.save()

def get_task(id):
    task = Task.select().where(Task.id == id).first()
    return task

def update_task(id, title, description, category_id=None):
    task = Task.select().where(Task.id == id).first()
    if task:
        task.title = title
        task.description = description
        task.category = category_id
        task.save()

def delete_task(id):
    task = Task.select().where(Task.id == id).first()
    if task:
        task.delete_instance()
