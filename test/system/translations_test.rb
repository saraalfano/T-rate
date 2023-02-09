require "application_system_test_case"

class TranslationsTest < ApplicationSystemTestCase
  setup do
    @translation = translations(:one)
  end

  test "visiting the index" do
    visit translations_url
    assert_selector "h1", text: "Translations"
  end

  test "should create translation" do
    visit translations_url
    click_on "New translation"

    fill_in "Episodio", with: @translation.episodio
    fill_in "Stagione", with: @translation.stagione
    fill_in "Tipo", with: @translation.tipo
    fill_in "Titolo", with: @translation.titolo
    fill_in "User", with: @translation.user_id
    click_on "Create Translation"

    assert_text "Translation was successfully created"
    click_on "Back"
  end

  test "should update Translation" do
    visit translation_url(@translation)
    click_on "Edit this translation", match: :first

    fill_in "Episodio", with: @translation.episodio
    fill_in "Stagione", with: @translation.stagione
    fill_in "Tipo", with: @translation.tipo
    fill_in "Titolo", with: @translation.titolo
    fill_in "User", with: @translation.user_id
    click_on "Update Translation"

    assert_text "Translation was successfully updated"
    click_on "Back"
  end

  test "should destroy Translation" do
    visit translation_url(@translation)
    click_on "Destroy this translation", match: :first

    assert_text "Translation was successfully destroyed"
  end
end
