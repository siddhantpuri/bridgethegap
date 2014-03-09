# == Schema Information
#
# Table name: causes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  dateCreated :string(255)
#  creator     :integer
#  description :string(255)
#  tagline     :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cause < ActiveRecord::Base
  attr_accessible :creator, :dateCreated, :description, :name, :tagline, :followers, :avatar
  serialize :followers
  has_and_belongs_to_many :users
  #has_many :evaluations, class_name: "RSEvaluation", as: :source
  has_reputation :votes, source: :user, aggregated_by: :sum

  has_attached_file :avatar, styles: { thumb: '200x200>'}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  def addUser(userId)
  	
  end
end
