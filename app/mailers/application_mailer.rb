# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'vn.kaoru@icloud.com'
  layout 'mailer'
end
