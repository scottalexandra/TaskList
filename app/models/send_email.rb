class SendEmail
  def self.email_user(params, task)
    if params[:task][:title].include?('/cc')
      email = params[:task][:title].split('/cc').last
      UserNotifier.email_task_list(email, task).deliver_now
    end
  end
end
