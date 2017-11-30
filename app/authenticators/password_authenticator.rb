class PasswordAuthenticator < Warden::Strategies::Base

  def authenticate!
    user = User.find_by(login: params['login'])

    if user&.authenticate(params['password'])
      success! user
    else
      fail 'Invalid login or password'
    end
  end

  def valid?
    params['login'] && params['password']
  end

end
