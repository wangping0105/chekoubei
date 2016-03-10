class Attachment < ActiveRecord::Base
  belongs_to :attachmentable, polymorphic: true
  belongs_to :user, polymorphic: true

  def file_url
    "/Attachments/#{attachmentable_type}/#{attachmentable_id}/#{file_name}"
  end
end
