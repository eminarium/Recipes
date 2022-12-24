class ApplicationMailer < ActionMailer::Base
  default from: "info@recipes.com"
  layout 'bootstrap-mailer'
end
