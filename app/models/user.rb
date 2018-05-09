class User < ApplicationRecord
  validates :name, presence: true
  has_many :created_events, class_name: 'Event', foreign_key: :creator_id
  has_many :attending_events, through: :event_attendees, source: :event
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
