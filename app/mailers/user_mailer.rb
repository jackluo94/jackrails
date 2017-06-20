class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_email.subject
  #
  def contact_email(params)
    @name = params['name']
    @phone = params['phone']
    @question = params['question']
    @prefered = params['prefered']
    @product = params['products']
    mail to: [params['email'], "jackluo94@hotmail.com"], bcc: ["dave.jones@scc.spokane.edu"]
  end

  def sent_article_email(article)
    @article = article
    mail to: ["jackluo94@hotmail.com"]
  end

  def sent_article_to_user( article, user)
    @article = article
    @user = user

    mail to: user.email.to_s
  end


end
