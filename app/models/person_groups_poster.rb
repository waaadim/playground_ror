class PersonGroupsPoster < ActiveRecord::Base
  belongs_to :poster
  belongs_to :person_group

  validates :poster, :person_group, presence: true
  validates_uniqueness_of :person_group_id, scope: :poster_id
end
