class User < ActiveRecord::Base
  extend ActiveSupport::Memoizable
  
  def full_name
    @full_name ||= "#{first_name} #{last_name}"
  end
  
  def has_full_name?
    return @has_full_name if defined?(@has_full_name)
    @has_full_name = (!first_name.blank? && !last_name.blank?)
  end
  
  def formal_name(salutation='Mr.', suffix=nil)
    @formal_name ||= {}
    return @formal_name[[salutation, suffix]] if @formal_name.has_key?([salutation, suffix])

    @formal_name[[salutation, suffix]] = "#{salutation} #{full_name} #{suffix}"
  end
  
  def initials(middle_initial)
    first_name[0] + middle_initial + last_name[0]
  end
  memoize :initials
end
