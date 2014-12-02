class Usermailer < ActionMailer::Base
  def compare_email(email, check, last_draw, checkstring)
    @email = email
    @check = check
    @last_draw = last_draw
    @checkstring = checkstring
    mail(to: email, from: "steven@stevenpuroll.com", subject: "Did you win?")   
  end
end