class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new title: params["task"]["title"], description: params["task"]["description"]
    if @task.save
      redirect_to tasks_path
    else
      render status: 404
    end
  end

  def edit
    @task = Task.find params['id']
  end

  def update
    task = Task.find params['id']
    if task.update title: params["task"]["title"], description: params["task"]["description"]
      redirect_to tasks_path
    else
      render status: 404
    end
  end

  def destroy
    task = Task.find params['id']
    if task.delete
      redirect_to tasks_path
    else
      render status: 404
    end
  end
end
