  class Project < ActiveRecord::Base
  	#attr_accessible :fieldname, :description, :start_date, :end_date
  	has_and_belongs_to_many :endusers
    has_many :endusers_projects


     validates :fieldname, :description, :presence => true
     validates :fieldname, :uniqueness => true

  def self.search(search)
     if search
       where('Fieldname LIKE ?', "%#{search}%")
      else
       Project.all
      end
     end
  end
