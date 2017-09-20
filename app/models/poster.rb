class Poster < ActiveRecord::Base
  belongs_to :person
  belongs_to :federal_legislator
  has_and_belongs_to_many :person_groups

  validate :should_have_poster
  validate :should_have_only_one_poster

  def name
    poster = posters.first
    format('%s %s', poster.first_name, poster.last_name)
  end

  private

  def should_have_poster
    errors.add(:poster, 'poster is nil') if posters.empty?
  end

  def should_have_only_one_poster
    errors.add(:poster, 'can have only one poster') if posters.size > 1
  end

  def posters
    [
      person,
      federal_legislator
    ].compact
  end
end
