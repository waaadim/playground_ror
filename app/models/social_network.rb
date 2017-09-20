class SocialNetwork < ActiveRecord::Base
  validates :name, presence: true

  def self.options_for_social_network
    order('LOWER(name)')
      .pluck(:name, :id)
  end
end
