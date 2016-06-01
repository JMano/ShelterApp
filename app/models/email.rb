class Email < MailForm::Base
  attribute :name, validate: true

  attribute :email_from
  validates_format_of :email_from, with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :text_message, validate: true
  attribute :nickname, captcha: true

  def headers
    {
      subject: "Contact Shelter",
      to: "shelterum@gmail.com",
      from: %("#{name}" <#{email_from}>),
    }
  end
end
