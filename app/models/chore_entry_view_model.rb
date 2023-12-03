class ChoreEntryViewModel
  include ActiveModel::API
  include ActiveModel::Model

  attr_writer :chore_entries
  attr_reader :chores
  attr_accessor :date

  validates :date, presence: true

  def chore_entries
    @chore_entries ||= build_chore_entries
  end

  def build_chore_entries
    Array(chores).map { ChoreEntry.new(chore: _1, date:) }
  end

  def chore_entries_attributes=(attr)
    @chore_entries = attr.map do |(id, entry_params)|
      ChoreEntry.new(({date:, completed: false}).merge(entry_params))
    end
  end

  def chores=(value)
    @chores = value
  end

  def save
    ChoreEntry.transaction do
      chore_entries.all?(&:save!)
    end
  rescue => ex
    errors.add(:chore_entries, "Unable to save all entries")
    false
  end
end