class MmddyyAttribute < ActiveModel::Type::Date

  private

  def cast_value(value)
    if value.is_a?(::String) && value =~ /\A\d{1,2}\/\d{1,2}\/\d{2}\z/
      Date.strptime(value, '%m/%d/%y')
    else
      super(value)
    end
  end
end
