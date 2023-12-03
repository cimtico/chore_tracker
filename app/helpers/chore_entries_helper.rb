module ChoreEntriesHelper
  def day_color(date, chores)
    return if date >= Date.today
    if chores.any?
      "done"
    else
      "pending"
    end
  end
end
