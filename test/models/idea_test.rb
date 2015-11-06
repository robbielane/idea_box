require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  test "idea is valid" do
    idea = Idea.new(title: 'Awesome Title!', body: 'Super interesting body')

    assert idea.valid?
  end

  test 'idea must have a title' do
    idea = Idea.new(body: 'fadfjdslkfsdlnfad')

    refute idea.valid?
  end

  test 'idea must have a body' do
    idea = Idea.new(title: 'Title')

    refute idea.valid?
  end
end
