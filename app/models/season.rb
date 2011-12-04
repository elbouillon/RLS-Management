class Season < ActiveRecord::Base
  has_many :players, through: :participants, class_name: "User"
  has_many :participants, class_name: "SeasonPlayer"
end
