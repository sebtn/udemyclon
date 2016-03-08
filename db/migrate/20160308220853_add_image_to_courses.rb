class AddImageToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :images, :string
  end
end
