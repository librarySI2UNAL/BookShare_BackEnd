class Photo < ApplicationRecord

		attr_accessible :image, :remote_image_url
		mount_uploader :image, ImageUploader
end
