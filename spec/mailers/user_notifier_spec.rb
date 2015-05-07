require "rails_helper"

RSpec.describe UserNotifier, type: :mailer do
  let(:task) { create(:task, title: "Eat Lunch /cc alexandra.scott335@gmail.com") }

  it "can send an email to user" do
    email = task.title.split('/cc')
    sent_email = UserNotifier.email_task_list(email, task)
    expect(sent_email).to_not be_nil
    expect(sent_email.to).to include("alexandra.scott335@gmail.com")
    expect(sent_email.from).to include("alex@tasklist.com")
    expect(sent_email.subject).to include("You have a new or updated task")
  end
end
