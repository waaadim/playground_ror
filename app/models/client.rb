class Client < ActiveRecord::Base
  has_and_belongs_to_many :person_groups

  validates :name, presence: true

  def self.options_for_select
    order('LOWER(name)').map { |e| [e.name, e.id] }
  end
end
