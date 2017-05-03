# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  title      :string
#  done       :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Task < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  def as_json(options)
    super(except: [:created_at, :updated_at])
  end
end
