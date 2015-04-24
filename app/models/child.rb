class Child < ActiveRecord::Base
  ##HasScope Filtering
  scope :by_gender, -> gender { where(gender: gender)}

  scope :by_sexual_preference, -> sexual_preference { where("sexual_preference = ? OR sexual_preference = ?", sexual_preference, "no preference")}


  scope :by_religion, -> religion { where(religion: religion)}
  scope :by_city, -> city { where(city: city)}
  scope :by_age, -> min, max {where("birthdate BETWEEN ? AND ?", Date.today-((max.to_i+1)*365), Date.today-(min.to_i*365.25))}
  scope :smoke, -> {where(smoke: false)} #Need to understand better.

  ##
  PF_IMAGE_INDEX = [:pf_image_1, :pf_image_2, :pf_image_3, :pf_image_4, :pf_image_5]

  before_validation :set_main_profile_image

  belongs_to :parent

  has_many :children_interests
  has_many :interests, through: :children_interests

  has_many :children_values
  has_many :values, through: :children_values

  has_many :initiated_playdates, class_name: 'Playdate', foreign_key: 'initiator_id'
  has_many :recipients, through: :initiated_playdates
  has_many :received_playdates, class_name: 'Playdate', foreign_key: 'recipient_id'
  has_many :initiators, through: :received_playdates

  validates :first_name, :last_name, :city, :state, :phone, :gender, :sexual_preference, :birthdate, :bio, :main_profile_image, presence: true
  # validates :phone, uniqueness: true
  validates :phone, format: { with: /\A\(?\d{3}(\)|\s|\.|\-)?\s?\d{3}(\-|\s|\.)?\d{4}\z/, message: 'is not in a valid format'}
  validates :pf_image_1, :pf_image_2, :pf_image_3, :pf_image_4, :pf_image_5, format: { with: /.+\.(jpg|jpeg|png)/, message: "is not a valid image" }, allow_blank: true
  validate :check_age

  def save_profile_image(uploaded_io, pf_image_key)
    # make_dir_unless_exists(Rails.root.join('public', 'uploads'))
    # make_dir_unless_exists(Rails.root.join('public','uploads', "#{self.parent.id}"))
    # make_dir_unless_exists(Rails.root.join('public','uploads', "#{self.parent.id}", "#{Child.last ? (Child.last.id + 1) : 1}"))

    # File.open(Rails.root.join('public','uploads', "#{self.parent.id}", "#{Child.last ? (Child.last.id + 1) : 1}", self[pf_image_key]), 'wb') do |file|
    #   file.write(uploaded_io.read)
    # end

    parent_id = self.parent.id
    child_id = Child.last ? (Child.last.id + 1) : 1

    begin
      cloudinary_response = Cloudinary::Uploader.upload(uploaded_io, public_id: "#{parent_id}/#{child_id}/#{pf_image_key}")
      self[pf_image_key] = cloudinary_response["secure_url"]
    rescue CloudinaryException => e
      self[pf_image_key] = e
    end
  end

  def default_pf
    case self.main_profile_image
    when 1
      self.pf_image_1
    when 2
      self.pf_image_2
    when 3
      self.pf_image_3
    when 4
      self.pf_image_4
    when 5
      self.pf_image_5
    end
  end

  def age
    now = Date.today
    if birthdate
      age = now.year - birthdate.year - (birthdate.to_date.change(:year => now.year) > now ? 1 : 0)
    end
  end

  def playdates
    self.initiated_playdates + self.received_playdates
  end

  def pending_dates
    self.playdates.select {|date| date.status == "pending"}
  end

  def upcoming_dates
    self.playdates.select {|date| (date.status == "accepted") && (date.playdate_at > Time.now)}
  end

  def past_dates
    self.playdates.select {|date| (date.status == "accepted") && (date.playdate_at < Time.now)}
  end

  def initiated_date?(date_object)
    initiator = date_object.initiator
    recipient = date_object.recipient
    if initiator.id == self.id
      return true
    elsif recipient.id == self.id
      return false
    else
      puts "This child neither initiated nor received this date"
      return nil
    end
  end

  private

  def make_dir_unless_exists(dir_name)
    Dir.mkdir(dir_name) unless File.directory?(dir_name)
  end

  def set_main_profile_image
    case
    when pf_image_1
      self.main_profile_image = 1
    when pf_image_2
      self.main_profile_image = 2
    when pf_image_3
      self.main_profile_image = 3
    when pf_image_4
      self.main_profile_image = 4
    when pf_image_5
      self.main_profile_image = 5
    end
  end

  def check_age
    if age
      errors.add(:birthdate, 'must be at least 18 years ago') if age < 18
    end
  end

end
