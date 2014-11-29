class Usermailer < ActionMailer::Base
  def task_email
    mail(to: "stevenpuroll@gmail.com", subject: "Task Working")   
  end
end
