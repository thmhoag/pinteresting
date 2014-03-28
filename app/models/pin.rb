class Pin < ActiveRecord::Base
		belongs_to :user

		# has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

		has_attached_file :image,
		    :storage => :dropbox,
		    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
		    :styles => { :medium => "300x300", :thumb => "100x100" },
		    :dropbox_options => {
		      :path => proc { |style| "#{style}/#{id}_#{image.original_filename}" }
		    }

		do_not_validate_attachment_file_type :image

		validates :description, presence: true
		validates :image, presence: true
end
