class OrderNotifierMailer < ApplicationMailer
  default from: 'Come&Shop <depot@example.com>'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.received.subject
  #

  def received(order)
    @order = order
    attachments.inline["10.png"] = File.read("#{Rails.root}/app/assets/images/10.png")
   
    @order.line_items.each do |line_item|
      line_item.product.image_url
      attachments.inline["#{line_item.product.image_url}"] = File.read("#{Rails.root}/app/assets/images/#{line_item.product.image_url}")
    end
    
    mail to: order.email, subject: 'Order Confirmation'
  end

  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Order Shipped'
  end



  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier_mailer.shipped.subject
  #

end
