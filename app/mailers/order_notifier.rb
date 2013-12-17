class OrderNotifier < ActionMailer::Base
  default from: "xlgwr110 <xlgwr110@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
#    @greeting = "Hi"
#    mail to: "to@example.org"
    @order = order
    mail to: order.email, subject: 'Pragmatic Store Order Confirmation(received)'
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject:'Pragmatic Store Order Shipped'
  end
end
