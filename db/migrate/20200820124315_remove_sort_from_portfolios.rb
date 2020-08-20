class RemoveSortFromPortfolios < ActiveRecord::Migration[6.0]
  def change
    remove_column :portfolios, :sort, :integer
  end
end
