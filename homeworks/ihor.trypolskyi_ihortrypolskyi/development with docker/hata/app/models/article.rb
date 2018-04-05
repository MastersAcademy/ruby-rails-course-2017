class Article < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader
  has_attachments :images, maximum: 6, accept: [:jpg, :png, :gif]
end
