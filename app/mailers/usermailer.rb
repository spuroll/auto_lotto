class Usermailer < ActionMailer::Base
  def task_email
    mail(to: "stevenpuroll@gmail.com", from: "steven@stevenpuroll.com", subject: "Did you win?")   
  end
end