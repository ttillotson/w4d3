class AddRequesterIdToCatRentalRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :cat_rental_requests, :requester_id, :integer
    add_index :cat_rental_requests, :requester_id
  end
end
