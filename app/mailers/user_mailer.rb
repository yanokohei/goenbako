class UserMailer < ApplicationMailer
  def new_letter(params)
    @receiver = User.find_by(id: params[:receiver_id])
    @sender = User.find_by(id: params[:sender_id])
    mail(to: @receiver.email, subject: 'ファンレターが届きました♪')
  end
end
