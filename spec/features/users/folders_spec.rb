require 'rails_helper'

feature "folder" do
  it "User can view a folder" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    folder = create(:folder, name: "Pies", parent: user.home)
    folder2 = create(:folder, name: "Blackberry", parent: folder)
    binary = create(:binary, name: "Recipe", folder: folder)

    user.home.folders << folder
    folder.folders << folder2
    folder.binaries << binary

    visit "/#{user.username}/home"

    click_on "Pies"

    expect(current_path).to eq("/#{user.username}/home/pies")

    within (".folder_contents") do
      expect(page).to have_content(folder2.name)
      expect(page).to have_content(folder2.updated_at)
      expect(page).to have_content(binary.name)
      expect(page).to have_content(binary.extension)
      expect(page).to have_content(binary.updated_at)
    end

    expect(page).to have_content("Upload File")
    expect(page).to have_content("New Folder")
    expect(page).to have_content("Share")
  end

  xit "User can view folder's share options" do
    user = create(:user_with_folders)
    folder = user.folders.last
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/#{user.username}/#{folder.route}"
    click_on "Share"

    expect(current_path).to eq("/#{user.username}/#{folder.route}/share")
    expect(page).to have_css("input", :count => 3)
    expect(page).to have_selector("input", :value =>"Public")
    expect(page).to have_selector("input", :value =>"Private")
    expect(page).to have_field("Share With User")
    expect(page).to have_content("Shared With:")

    expect(page).to have_content("Save")
  end
end
