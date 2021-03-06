class Entry < ActiveRecord::Base

  validates_presence_of :text_to_display, :text_created_at,
                    :tags, :md5, :source, :link

  # ActiveRecord::RecordInvalid: Validation failed: Md5 has already been taken
  validates_uniqueness_of :md5

end