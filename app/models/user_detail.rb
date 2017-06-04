class UserDetail < ActiveRecord::Base
  belongs_to :User

  def full_name
    return nil if self.f_name.nil?
    self.f_name+" "+self.l_name
  end

  def get_visa_name
    return "Not Set" if self.visa_status.nil?
    visa = VisaType.find(self.visa_status)
    !visa.nil? ? visa[:name] : "Not set"
  end

end
