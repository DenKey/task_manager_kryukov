Devise.setup do |config|

  config.mailer_sender = 'no-reply@krtodolist.herokuapp.com'

  require 'devise/orm/active_record'
  require 'omniauth'
  require 'omniauth-linkedin'
  require 'omniauth-facebook'
  require 'omniauth-github'

  config.case_insensitive_keys = [ :email ]

  config.strip_whitespace_keys = [ :email ]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 10

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  # Range for password length.
  config.password_length = 8..128

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.secret_key = '9227927399a2355ab9700ae364d4d7efb029c0a7701e3cffab2ddb93bb8d1687a6cb26601c95d05d9269932f777895f2be82a8b922aa42dccd7877fa97e491d5'

  config.omniauth :facebook, "1598321553779556", "6f10f398d239dba4a46b3a0f75a7c6eb"
  config.omniauth :github, "35a4a5cacd40410b8636", "9ecf7cd66b5cb7a25fbcbbdd264f6a797d21ac1c"
  config.omniauth :linkedin, "77riwztglqev7m", "zB0jReNI1le4wDTr"

end
