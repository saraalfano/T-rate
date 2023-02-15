require 'rails_helper'

RSpec.describe Translation, type: :model do
  describe "Create a Translation without titolo" do 
    it "shouldn't be permitted" do 
        translation = Translation.create(tipo: 'film', deadline: '12/02/2023', revisore_id: 1, originale: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/upload_files/All.American.S05E11.srt'))))
        expect(translation).to_not be_valid 
    end 
  end

  describe "Create a Translation without deadline" do 
    it "shouldn't be permitted" do 
        translation = Translation.create(titolo:"file1", tipo: 'film', deadline: '12/02/2023', revisore_id: 1, originale: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/upload_files/All.American.S05E11.srt'))))
        expect(translation).to_not be_valid 
    end 
  end 

  describe "Create a Translation with tipo serie but without season" do 
    it "shouldn't be permitted" do 
        translation = Translation.create(titolo:"file1", tipo: 'serie', episodio: 5, deadline: '12/02/2023', revisore_id: 1, originale: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/upload_files/All.American.S05E11.srt'))))
        expect(translation).to_not be_valid 
    end 
  end 

  describe "Create a Translation with tipo serie but without episode" do 
    it "shouldn't be permitted" do 
        translation = Translation.create(titolo:"file1", tipo: 'serie', stagione: 2, deadline: '12/02/2023', revisore_id: 1, originale: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/upload_files/All.American.S05E11.srt'))))
        expect(translation).to_not be_valid 
    end 
  end 

  describe "Create a Translation without deadline" do 
    it "shouldn't be permitted" do 
        translation = Translation.create(titolo:"file1", tipo: 'film', revisore_id: 1, originale: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, 'spec/upload_files/All.American.S05E11.srt'))))
        expect(translation).to_not be_valid 
    end 
  end

  describe "Create a Translation without originale file" do 
    it "shouldn't be permitted" do 
        translation = Translation.create(titolo:"file1", tipo: 'film', deadline: '12/02/2023', revisore_id: 1)
        expect(translation).to_not be_valid 
    end 
  end
 
end
