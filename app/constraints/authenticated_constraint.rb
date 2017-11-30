class AuthenticatedConstraint

  def self.current_user(request)
    self.new.send(:current_user,request)
  end

  def matches?(request)
    ! current_user(request).nil?
  end

  protected

  def current_user(request)
    request.env['warden'].user
  end
end
