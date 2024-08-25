require "application_system_test_case"

class MentionsTest < ApplicationSystemTestCase
  setup do
    @mention = mentions(:one)
  end

  test "visiting the index" do
    visit mentions_url
    assert_selector "h1", text: "Mentions"
  end

  test "should create mention" do
    visit mentions_url
    click_on "New mention"

    fill_in "Message", with: @mention.message_id
    fill_in "User", with: @mention.user_id
    click_on "Create Mention"

    assert_text "Mention was successfully created"
    click_on "Back"
  end

  test "should update Mention" do
    visit mention_url(@mention)
    click_on "Edit this mention", match: :first

    fill_in "Message", with: @mention.message_id
    fill_in "User", with: @mention.user_id
    click_on "Update Mention"

    assert_text "Mention was successfully updated"
    click_on "Back"
  end

  test "should destroy Mention" do
    visit mention_url(@mention)
    click_on "Destroy this mention", match: :first

    assert_text "Mention was successfully destroyed"
  end
end
