class CreateEntry < ActiveRecord::Migration
  def change
    create_table :entry do |t|
      t.string :text_to_display
      t.date   :text_created_at    
      t.string :tags      
      t.string :md5  
      t.string :source         
        
    end
  end
end
