Spree::OrderMailer.class_eval do
  def confirm_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.confirm_email.subject')} ##{order.number}"
    if order.dibs_referral
      mail(to: order.email, subject: subject, cc: order.dibs_referral.email)
    else
      mail(to: order.email, subject: subject)
    end
  end

  def cancel_email(order, resend = false)
    @order = order
    subject = (resend ? "[#{t(:resend).upcase}] " : '')
    subject += "#{Spree::Config[:site_name]} #{t('order_mailer.cancel_email.subject')} ##{order.number}"
    if order.dibs_referral
      mail(to: order.email, subject: subject, cc: order.dibs_referral.email)
    else
      mail(to: order.email, subject: subject)
    end
  end
end
