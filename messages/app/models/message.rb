class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: "User"
  validates_presence_of :title
  validates_presence_of :text
  validates_presence_of :recipient
end
