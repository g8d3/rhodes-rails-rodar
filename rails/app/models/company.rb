class Company < ActiveRecord::Base
  attr_accessible :name
  has_many :buses
  include Rhoconnect::Resource

  def partition
    :app
  end

  delegate :to_s, to: :name

  def self.names_ids
    all.collect{|c| [c.name, c.id]}
  end

  def self.rhoconnect_query(partition = nil)
    all
  end
end
