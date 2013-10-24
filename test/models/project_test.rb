require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "project attributes must not be empty" do
project = Project.new
assert project.invalid?
assert project.errors[:Fieldname].any?
assert project.errors[:description].any?
 end
end

