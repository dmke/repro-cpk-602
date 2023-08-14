class CreateSchema < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.timestamps null: false
    end

    create_table :owners do |t|
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :houses do |t|
      t.belongs_to :owner, foreign_key: { on_delete: :restrict }, null: false
      t.string :name, null: false
      t.timestamps null: false
    end

    create_table :house_inquiries, id: false do |t|
      t.belongs_to :inquiry, foreign_key: { on_delete: :restrict }, null: false
      t.belongs_to :house,   foreign_key: { on_delete: :restrict }, null: false
      t.timestamps null: false
      t.index %w[inquiry_id house_id], unique: true
    end

    create_table :house_owner_billings do |t|
      t.belongs_to :inquiry, foreign_key: { on_delete: :restrict }, null: false
      t.belongs_to :owner,   foreign_key: { on_delete: :restrict }, null: false
      t.timestamps null: false
    end
  end
end
