class CreateAdds < ActiveRecord::Migration
  def change
    create_table :adds do |t|
      t.string :title
      t.text :body
      t.boolean :active

      t.timestamps null: false
    end
  end
end
