class PersonGroup < ActiveRecord::Base
  has_and_belongs_to_many :posters
  has_and_belongs_to_many :clients

  def self.options_for_person_group
    order('LOWER(name)')
      .pluck(:name, :id)
  end
end
