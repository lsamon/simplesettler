class UserDetail < ActiveRecord::Base
  belongs_to :User

  def full_name
    self.f_name+" "+self.l_name
  end

  def get_visa_name
    visa = VisaType.find(self.visa_status)
    !visa.nil? ? visa[:name] : "Not set"
  end

end
