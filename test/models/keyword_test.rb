require 'test_helper'

class KeywordTest < ActiveSupport::TestCase

  test "Keyword length less than min" do
    keyword = Keyword.new(content: "i").save
    assert_not keyword
  end

  test "keyword length sufficient" do
    keyword = Keyword.new(content: "Hi").save
    assert keyword
  end

end
