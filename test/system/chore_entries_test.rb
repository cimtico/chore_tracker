require "application_system_test_case"

class ChoreEntriesTest < ApplicationSystemTestCase
  setup do
    @chore_entry = chore_entries(:one)
  end

  test "visiting the index" do
    visit chore_entries_url
    assert_selector "h1", text: "Chore entries"
  end

  test "should create chore entry" do
    visit chore_entries_url
    click_on "New chore entry"

    fill_in "Chore", with: @chore_entry.chore_id
    check "Completed" if @chore_entry.completed
    fill_in "Date", with: @chore_entry.date
    click_on "Create Chore entry"

    assert_text "Chore entry was successfully created"
    click_on "Back"
  end

  test "should update Chore entry" do
    visit chore_entry_url(@chore_entry)
    click_on "Edit this chore entry", match: :first

    fill_in "Chore", with: @chore_entry.chore_id
    check "Completed" if @chore_entry.completed
    fill_in "Date", with: @chore_entry.date
    click_on "Update Chore entry"

    assert_text "Chore entry was successfully updated"
    click_on "Back"
  end

  test "should destroy Chore entry" do
    visit chore_entry_url(@chore_entry)
    click_on "Destroy this chore entry", match: :first

    assert_text "Chore entry was successfully destroyed"
  end
end
