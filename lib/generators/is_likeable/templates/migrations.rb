# lib/generators/is_likeable/templates/migrations.rb
class CreateFbLikes < ActiveRecord::Migration
  def self.up
    create_table :fb_likes do |t|
      t.string    :owner_type
      t.integer   :owner_id
      t.string    :title
      t.text      :description
      t.string    :youtube_id
      t.string    :image_file_name    
      t.string    :image_content_type
      t.integer   :image_file_size   
      t.datetime  :image_updated_at
      t.string    :redirect_to_url

      t.timestamps
    end
    
    add_index :fb_likes, [:owner_id, :owner_type], :unique => true
  end

  def self.down
    drop_table :fb_likes
  end
end
