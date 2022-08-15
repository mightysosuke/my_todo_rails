require 'ulid'

module UlidPk
  extend ActiveSupport::Concern

  included do
    before_create :set_ulid
  end

  def set_ulid
    self.id = ULID.generate if self.id.blank?
  end
end
