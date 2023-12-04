class ChoreEntry < ApplicationRecord
  belongs_to :chore

  validates :date, presence: true

  before_create :set_value

  def name
    chore.name
  end

  def start_time
    date
  end

  def set_value
    self.value = chore.value
  end
end
