require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "accepted report passes accepted? method" do
    r = reports(:first_report)
    assert_not r.accepted?
    r.accepted_by_project_owner = true
    r.save
    assert r.accepted?
  end

  test "denied report fails accepted? method" do
    r = reports(:first_report)
    assert_not r.accepted?
    r.accepted_by_project_owner = false
    r.save
    assert_not r.accepted?
  end
end
