class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
        t.string 'title'
        t.string 'genre'
        t.text 'description'
        t.datetime 'release_date'
        t.timestamp
        
    end
  end
end
