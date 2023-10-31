require 'rails_helper'

RSpec.describe 'Homes', type: :request do
  describe 'index page' do
    it 'shows the right content' do
      visit home_index_path
      sleep(5)
      expect(page).to have_content('Home')
    end
  end
end
