class Group < ActiveRecord::Base
  has_and_belongs_to_many :seasons
  has_many :subscribers, class_name: "Subscription"
  # has_many :players, class_name: "User", through: :subscribers, foreign_key: "user_id"
end
