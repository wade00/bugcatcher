require 'test_helper'

class ProjectTest < ActiveSupport::TestCase

  # On projects I think the only thing I would test is this validation:
  # validates :name, presence: true, uniqueness: { scope: :user_id }
  # Specially the uniqueness. Because it would prevent the user to create
  # a project if you delete this by accident and I'm pretty sure the users
  # would never reported the bad UX. Everything else is straightforward and
  # easy to fix if you let a mistake pass.

  test "project name cannont be blank" do
    project_count = Project.count
    p1 = Project.new(owner: users(:daniel),
                     name: '',
                     description: 'Teach your best class')

    assert(!p1.valid?)
    assert(p1.errors.messages[:name].present?)

    p1.save
    assert_equal Project.count, project_count
  end

  test "user can't have two project with same name" do
    project_count = Project.count
    p1 = Project.new(owner: users(:daniel),
                     name: 'Test Project',
                     description: 'Teach your best class')

    p1.save
    assert_equal Project.count, (project_count + 1)

    p2 = Project.new(owner: users(:daniel),
                     name: 'Test Project',
                     description: 'Different description')

    assert(!p2.valid?)
    assert(p2.errors.messages[:name].present?)
    assert_equal Project.count, (project_count + 1)
  end

end
