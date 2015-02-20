class Status < ActiveRecord::Base
  validates :user_name, :description, presence: true
end
