class PostMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.in_stock.subject
  #
  def in_stock
    @post = params[:post]
    mail to: params[:subscriber].email
  end

end
