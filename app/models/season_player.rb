class SeasonPlayer < ActiveRecord::Base
  belongs_to :season
  belongs_to :player, class_name: "User"
end
