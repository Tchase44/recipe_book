class JsonWebToken

  def self.encode payload
    payload.reverse_merge!(meta)
    JWT.encode(payload, Rails.application.secrets.secret_key_base, 'HS384')
  end

  def self.decode token
    JWT.decode(token, Rails.application.secrets.secret_key_base, nil, {algorith: 'HS384'})
  end

  # Validates the payload hash for expiration and meta claims
  def self.valid_payload(payload)
    if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
      return false
    else
      return true
    end
  end

  def self.meta
    # 'exp' (Expiration Time)
    # 'nbf' (Not Before Time)
    # 'iss' (Issuer)
    # 'aud' (Audience)
    # 'jti' (JWT ID)
    # 'iat' (Issued At)
    # 'sub' (Subject)
    {
      exp: 8.hours.from_now.to_i,
      iss: "recipe book",
      aud: "Vue Client"
    }
  end

  def self.expired paylaod
    Time.at(paylaod['exp']) < Time.now
  end
end