# == Schema Information
#
# Table name: venues
#
#  id           :integer          not null, primary key
#  address      :string
#  name         :string
#  neighborhood :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Venue < ApplicationRecord
  validates(:name, {
    :presence => true,
    :uniqueness => { :case_sensitive => false },
  })

  def comments
    my_id = self.id
    matching_comments = Comment.where({ :venue_id => my_id })
    list_of_comments = matching_comments.order({:created_at => :desc})
    return list_of_comments
  end
end
