class ClientsPersonGroup < ActiveRecord::Base
  belongs_to :client
  belongs_to :person_group

  validates :client, :person_group, presence: true
  validates_uniqueness_of :client_id, scope: :person_group_id
end
