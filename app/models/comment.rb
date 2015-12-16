class Comment < ActiveRecord::Base
validates :content,presence: true,
		length: { minimum: 1}


        belongs_to :article
end
