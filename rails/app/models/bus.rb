class Bus < ActiveRecord::Base
  attr_accessible :company_id, :seats
  belongs_to :company
  include Rhoconnect::Resource

  def partition
    :app
  end

  def self.rhoconnect_query(partition = nil)
    includes(:company)
  end
end
