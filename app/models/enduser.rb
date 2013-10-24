  class Enduser < ActiveRecord::Base
  	has_and_belongs_to_many :projects
  	has_many :endusers_projects
      has_attached_file :photo, 
        :styles => { :small => "150x150>" },
        :url => "/system/:attachment/:id/:style/:basename.:extension",
        :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"
  	validates :firstname, :lastname, :empno, :dateofbirth, :address, :presence => true
    validates :firstname, :uniqueness => true
  	validates_attachment_presence :photo
      validates_attachment_size :photo, :less_than => 5.megabytes
      validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
    
  	
      #def asso(proj_id,id)
  	#	project=Project.find(param[:project_id])
  	#	puts project.id
  	#	puts project.inspect
  	#	project.update_attribute(:enduser_id, id)
  	#end

  	def self.search(search)
        if search
           where('Firstname LIKE ?', "%#{search}%")
        else
           Enduser.all
        end
      end
  end
