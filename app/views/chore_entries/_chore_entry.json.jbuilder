json.extract! chore_entry, :id, :chore_id, :date, :completed, :created_at, :updated_at
json.url chore_entry_url(chore_entry, format: :json)
