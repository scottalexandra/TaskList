class UserNotifier < ApplicationMailer
  default :from => 'alex@tasklist.com'

  def email_task_list(email, task)
    @task = task
    @email = email
    mail(to: @email,
         subject: "You have a new or updated task",
         body: "Task details: Title: #{@task.title}, Description: #{@task.description}, Due Date: #{@task.due}"
         )
  end
end
