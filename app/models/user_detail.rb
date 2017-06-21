class UserDetail < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  mount_uploader :resume, AttachmentUploader

  belongs_to :User

  validates :resume, :country_id, presence: true

  def full_name
    "#{f_name} #{l_name}"
  end

  def current_visa
    visa = VisaType.find(visa_status)
    visa.present? ? visa[:name] : "Not set"
  end

  def requested_visa
    visa = VisaType.find(visa_help_type)
    visa.present? ? visa[:name] : "Not set"
  end

end
