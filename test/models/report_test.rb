require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "report saved" do
    original_report_total = Report.count
    r = Report.new(content: "New report")
    r.save
    assert_equal (original_report_total + 1), Report.count
  end

  test "accepted report passes accepted? method" do
    r = reports(:first_report)
    assert r.accepted_by_project_owner == nil
    r.accepted_by_project_owner = true
    r.save
    assert r.accepted? == true
  end

  test "denied report fails accepted? method" do
    r = reports(:first_report)
    assert r.accepted_by_project_owner == nil
    r.accepted_by_project_owner = false
    r.save
    assert r.accepted? == false
  end
end
