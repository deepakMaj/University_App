class AddEmbedcode < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :embedcode, :string
  end
end
