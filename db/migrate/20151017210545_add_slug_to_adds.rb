class AddSlugToAdds < ActiveRecord::Migration
  def change
    add_column :adds, :slug, :string
    add_index :adds, :slug, unique: true
  end
end
