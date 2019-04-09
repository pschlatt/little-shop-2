require 'rails_helper'

RSpec.describe 'Merchant Items Index Page', type: :feature do
  describe 'as a merchant visiting my items page' do
    before :each do

      @merch = create(:merchant)
      @user = create(:user)

      @item_1 = create(:item, user_id: @merch.id, stock: 75)
      @item_2 = create(:item, user_id: @merch.id, stock: 85)
      @item_3 = create(:item, user_id: @merch.id, stock: 95)
      @item_4 = create(:item, user_id: @merch.id, stock: 105)

      @order_1 = create(:order, user_id: @user.id)
      # @order_3 = create(:order, user_id: @user_2.id)
      # @order_3 = create(:order, status: 'shipped', user_id: @user_2.id)
      # @order_4 = create(:shipped_order, user_id: @user_2.id)
      # @order_item_1 = OrderItem.create(quantity: 6, order_price: 2.0, order_id: @order_1.id, item_id: @item_1.id)
      # @order_item_2 = OrderItem.create(quantity: 4, order_price: 3.0, order_id: @order_1.id, item_id: @item_2.id)
      # @order_item_3 = OrderItem.create(quantity: 3, order_price: 4.0, order_id: @order_2.id, item_id: @item_3.id)
      # @order_item_4 = OrderItem.create(quantity: 5, order_price: 2.0, order_id: @order_3.id, item_id: @item_3.id)
      # @order_item_5 = OrderItem.create(quantity: 7, order_price: 3.0, order_id: @order_3.id, item_id: @item_4.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merch)

      visit dashboard_items_path
    end

    it 'shows a link to add new items to the system' do

      expect(page).to have_link("Add New Item")
    end

    it 'shows all items that I have added to the system including - id, name, image, price, inventory, and edit link' do
      # save_and_open_page
      within "#item-#{@item_1.id}" do
        expect(page).to have_content("ID: #{@item_1.id}")
        expect(page).to have_content(@item_1.name)
        expect(page).to have_content("Price: #{@item_1.item_price}")
        expect(page).to have_content("Stock: #{@item_1.stock}")
        # expect(page).to have_xpath("//img[@src='#{@item_1.image}']")
        expect(page).to have_link("Edit")
      end

      within "#item-#{@item_2.id}" do
        expect(page).to have_content("ID: #{@item_2.id}")
        expect(page).to have_content(@item_2.name)
        expect(page).to have_content("Price: #{@item_2.item_price}")
        expect(page).to have_content("Stock: #{@item_2.stock}")
        # expect(page).to have_xpath("//img[@src='#{@item_1.image}']"2
        expect(page).to have_link("Edit")
      end
    end

    context'when I click an enable button next to an item' do
      xit 'return me to my items page, I see a confirmation message, and I see that the item is now enabled for sale' do


      end
    end
  end
end

#
# As a merchant
# When I visit my items page
# And I click on an "enable" button or link for an item
# I am returned to my items page
# I see a flash message indicating this item is now available for sale
# I see the item is now enabled