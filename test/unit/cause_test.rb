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

require 'test_helper'

class CauseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
