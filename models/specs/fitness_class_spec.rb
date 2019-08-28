require("minitest/autorun")
require('minitest/rg')
require_relative("../fitness_class")

class FitnessClassTest < Minitest::Test

  def setup
    options = {'id' => 1, 'name' => 'Pilates', 'datetime' => '2019-08-27 14:00:00', 'capacity' => 5 }
    @fitness_class1 = FitnessClass.new(options)
  end

  def test_fitness_class_name
    assert_equal('Pilates', @fitness_class1.name)
  end

  def test_fitness_class_id
    assert_equal(1, @fitness_class1.id)
  end

  def test_fitness_class_datetime
    assert_equal('2019-08-27 14:00:00', @fitness_class1.datetime)
  end

  def test_format_date
    assert_equal('27/08/2019', @fitness_class1.format_date )
  end

  def test_format_time
    assert_equal('14:00', @fitness_class1.format_time )
  end

def test_capacity
  assert_equal(5, @fitness_class1.capacity )
end


  #FINAL END
end
