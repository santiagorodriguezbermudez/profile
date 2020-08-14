class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :short_description
      t.text :long_description
      t.string :company
      t.string :role
      t.integer :year
      t.string :stacks, array: true
      t.string :image_url
      t.string :repo_url
      t.string :live_url
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.datetime :image_updated_at
      t.timestamps
    end
  end
end
