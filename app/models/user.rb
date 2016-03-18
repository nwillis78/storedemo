class User < ActiveRecord::Base
  include EpiCas::DeviseHelper
  
  
  belongs_to :role
  has_many :items

  validates_presence_of :name
  before_save :assign_role



  def assign_role
  	self.role = Role.find_by name: "Regular" if self.role.nil?
  end

  def admin?
  	self.role.name == "Admin"
  end

  def seller?
  	self.role.name == "Seller"
  end
  def regular?
  	self.role.name == "Regular"
  end
end
