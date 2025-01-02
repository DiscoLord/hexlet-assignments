# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one) # Фикстура для задачи
  end

  test 'should get index' do
    get tasks_url
    assert_response :success
    assert_select 'h1', 'Tasks'
  end

  test 'should get new' do
    get new_task_url
    assert_response :success
    assert_select 'h1', 'New task'
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post tasks_url,
           params: { task: { name: 'New Task', description: 'Test description', status: 'new', creator: 'John Doe',
                             completed: false } }
    end
    assert_redirected_to task_url(Task.last)
    follow_redirect!
    assert_select 'h1', 'New Task'
  end

  test 'should show task' do
    get task_url(@task)
    assert_response :success
    assert_select 'h1', @task.name
  end

  test 'should get edit' do
    get edit_task_url(@task)
    assert_response :success
    assert_select 'h1', 'Edit Task'
  end

  test 'should update task' do
    patch task_url(@task), params: { task: { name: 'Updated Task', description: 'Updated description' } }
    assert_redirected_to task_url(@task)
    follow_redirect!
    assert_select 'h1', 'Updated Task'
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete task_url(@task)
    end
  end
end
