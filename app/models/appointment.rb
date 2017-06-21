class Appointment < ActiveRecord::Base
  belongs_to :user
  enum appointment_type: { face_to_face: 0, skype: 1 }

  private
end
