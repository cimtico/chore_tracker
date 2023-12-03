require "test_helper"

class ChoreEntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chore_entry = chore_entries(:one)
  end

  test "should get index" do
    get chore_entries_url
    assert_response :success
  end

  test "should get new" do
    get new_chore_entry_url
    assert_response :success
  end

  test "should create chore_entry" do
    assert_difference("ChoreEntry.count") do
      post chore_entries_url, params: { chore_entry: { chore_id: @chore_entry.chore_id, completed: @chore_entry.completed, date: @chore_entry.date } }
    end

    assert_redirected_to chore_entry_url(ChoreEntry.last)
  end

  test "should show chore_entry" do
    get chore_entry_url(@chore_entry)
    assert_response :success
  end

  test "should get edit" do
    get edit_chore_entry_url(@chore_entry)
    assert_response :success
  end

  test "should update chore_entry" do
    patch chore_entry_url(@chore_entry), params: { chore_entry: { chore_id: @chore_entry.chore_id, completed: @chore_entry.completed, date: @chore_entry.date } }
    assert_redirected_to chore_entry_url(@chore_entry)
  end

  test "should destroy chore_entry" do
    assert_difference("ChoreEntry.count", -1) do
      delete chore_entry_url(@chore_entry)
    end

    assert_redirected_to chore_entries_url
  end
end
