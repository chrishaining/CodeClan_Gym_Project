require("minitest/autorun")
require('minitest/rg')
require_relative("../member")

class MemberTest < Minitest::Test

  def setup
    options = {'id' => 1, 'first_name' => 'Ravi', 'last_name' => 'Rogers'}
    @member1 = Member.new(options)
  end

  def test_member_first_name
    assert_equal("Ravi", @member1.first_name)
  end

  def test_member_last_name
    assert_equal("Rogers", @member1.last_name)
  end

  def test_member_id
    assert_equal(1, @member1.id)
  end

  def test_pretty_name
    assert_equal('Ravi Rogers', @member1.pretty_name)
  end

  #FINAL END
end
