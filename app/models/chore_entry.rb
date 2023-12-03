class ChoreEntry < ApplicationRecord
  belongs_to :chore

  validates :date, presence: true

  def name
    chore.name
  end

  def start_time
    date
  end
end
