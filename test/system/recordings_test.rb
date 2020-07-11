require "application_system_test_case"

class RecordingsTest < ApplicationSystemTestCase
  setup do
    @recording = recordings(:one)
  end

  test "visiting the index" do
    visit recordings_url
    assert_selector "h1", text: "Recordings"
  end

  test "creating a Recording" do
    visit recordings_url
    click_on "New Recording"

    fill_in "Duration", with: @recording.duration
    fill_in "Name", with: @recording.name
    fill_in "Record at", with: @recording.record_at
    fill_in "Source uri", with: @recording.source_uri
    click_on "Create Recording"

    assert_text "Recording was successfully created"
    click_on "Back"
  end

  test "updating a Recording" do
    visit recordings_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @recording.duration
    fill_in "Name", with: @recording.name
    fill_in "Record at", with: @recording.record_at
    fill_in "Source uri", with: @recording.source_uri
    click_on "Update Recording"

    assert_text "Recording was successfully updated"
    click_on "Back"
  end

  test "destroying a Recording" do
    visit recordings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Recording was successfully destroyed"
  end
end
