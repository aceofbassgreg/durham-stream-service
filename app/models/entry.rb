class Entry < ActiveRecord::Base

  validates_presence_of :text_to_display, :text_created_at,
                    :tags, :md5, :source

end