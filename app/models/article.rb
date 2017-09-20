class Article < ActiveRecord::Base
  belongs_to :social_network
  belongs_to :poster
  has_one :person_groups, through: :poster

  validates :publish_date, :poster, presence: true

  self.per_page = 10

  filterrific(
    default_filter_params: {
      sorted_by: 'publish_date_desc'
    },
    available_filters: %i[
      sorted_by
      with_clients
      with_person_group
      with_social_networks
      published_after
      published_before
    ]
  )

  scope :includes_author, lambda {
    eager_load(poster: %i[person federal_legislator])
  }

  scope :with_clients, lambda { |client_id|
    joins(person_groups: :clients)
      .where(clients: { id: client_id })
  }

  scope :sorted_by, lambda { |sort_option|
    direction = sort_option =~ /desc$/ ? 'desc' : 'asc'

    case sort_option.to_s
    when /^publish_date_/
      order("articles.publish_date #{direction}")
    when /^name_/
      order("LOWER(articles.title) #{direction}")
    else
      raise(ArgumentError, "Invalid sort option: #{sort_option.inspect}")
    end
  }

  scope :with_social_networks, lambda { |social_networks|
    where(social_network_id: social_networks)
  }

  scope :with_person_group, lambda { |person_group|
    eager_load(:person_groups)
      .where(person_groups: { id: person_group })
  }

  scope :published_after, lambda { |date|
    where('articles.publish_date >= ?', date)
  }

  scope :published_before, lambda { |date|
    where('articles.publish_date <= ?', date)
  }

  def self.options_for_sorted_by
    [
      ['Name (a-z)', 'name_asc'],
      ['Name (z-a)', 'name_desc'],
      ['Publish date (newest first)', 'publish_date_desc'],
      ['Publish date (oldest first)', 'publish_date_asc']
    ]
  end
end
