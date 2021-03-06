class Hostel < ApplicationRecord
  belongs_to :commune

  has_many :hostel_registrations
  has_many :users, through: :hostel_registrations
  has_many :hostel_features
  has_many :room_types

  has_one :region, through: :commune
  has_one_attached :principal_image

  def region_id
    if defined? region.id
      region.id
    else
      nil
    end
  end

  def full_address
    "Chile, #{region.full_name}, #{commune.full_name}, #{address} #{address_number}"
  end

  def value_per_night_from
    room_types.map { |e| e.value_per_night }.min.to_i
  end
end
