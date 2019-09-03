class AddImgUrlToDogs < ActiveRecord::Migration[5.1]
  def change
    add_column :dogs, :img_url, :string
  end
end
