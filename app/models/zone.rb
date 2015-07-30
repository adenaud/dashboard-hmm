class Zone < ActiveRecord::Base
  belongs_to :alliance, foreign_key: 'id_alliance'
end
