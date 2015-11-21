require 'test/unit'
require './dayofweek'

class DayOfWeekTest < Test::Unit::TestCase
	setup do
    @dayofweek = DayOfWeek.new
  end

  sub_test_case 'english case'  do
    data('shorten' => ["sun","mon","tue","wed","thu","fri","sat"])
    test 'english dayofweek shorten_en' do |shorten|
      expected = shorten
      assert_equal(expected, @dayofweek.shorten_en)
    end

    data('lengthen' => ["sunday","monday","tuesday","wednesday","thursday","friday","saturday"])
    test 'english dayofweek lengthen_en' do |lengthen|
      expected = lengthen
      assert_equal(expected, @dayofweek.lengthen_en)
    end
  end

  sub_test_case 'japanese case' do
    data('shorten' => ["日","月","火","水","木","金","土"])
    test 'english dayofweek shorten_ja' do |shorten|
      expected = shorten
      assert_equal(expected, @dayofweek.shorten_ja)
    end

    data('lengthen' => ["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"])
    test 'english dayofweek lengthen_ja' do |lengthen|
      expected = lengthen
      assert_equal(expected, @dayofweek.lengthen_ja)
    end
  end
end