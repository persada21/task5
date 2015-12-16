class Article < ActiveRecord::Base
  
		#validates :title,presence: true,
		#length: { minimum: 2}

	#validates :content, presence: true,
		#length: {minimum: 2}

	scope :status_active, -> {where(status: true)}
        has_many :comments, dependent: :destroy
         paginates_per 2


		
	end


