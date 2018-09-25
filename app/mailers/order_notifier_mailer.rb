class OrderNotifierMailer < ApplicationMailer
  default from: 'Come&Shop <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #

  def received(order)
    @order = order
    mail to: order.email, subject: 'Come&Shop Order Confirmation'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Come&Shop Order Shipped'
  end



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #

end
