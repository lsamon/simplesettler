class UserDetail < ActiveRecord::Base
  belongs_to :User

  def full_name
    self.f_name+" "+self.l_name
  end
end
