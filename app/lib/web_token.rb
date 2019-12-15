module WebToken
  if Rails.env.prodution?
    SECRET = ENV['SECRET_KEY_BASE']
  else
    SECRET = Rails.application.secrets.secret_key_base
  end
  EXPIRY = (Time.now + 1.day).to_i
  class << self
    def decode(token)
      JWT.decode(
        token,
        WebToken::SECRET,
        true, { algorithm: 'HS256' }
      ).first
    rescue JWT::ExpiredSignature
      :expired
    end
    def encode(user)
      JWT.encode(
        token_params(user),
        WebToken::SECRET,
        'HS256'
      )
    end

    private

    def token_params(user)
      {
        user_id: user.id,
        exp: EXPIRY,
        name: user.username,
        #email: user.email
      }
    end
  end
end
