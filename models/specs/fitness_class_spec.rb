require("minitest/autorun")
require('minitest/rg')
require_relative("../fitness_class")

class FitnessClassTest < Minitest::Test

  def setup
    options = {'id' => 1, 'name' => 'Pilates', 'fitness_class_date' => 25-08-2019, 'fitness_class_time' => '11:00' }
    @fitness_class1 = FitnessClass.new(options)
  end

  def test_fitness_class_name
    assert_equal('Pilates', @fitness_class1.name)
  end

  def test_fitness_class_id
    assert_equal(1, @fitness_class1.id)
  end

  def test_fitness_class_date
    assert_equal('25-8-2019', @fitness_class1.fitness_class_date)
  end

  #FINAL END
end
