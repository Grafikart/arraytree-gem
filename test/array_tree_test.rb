require 'test_helper'

class ArrayTreeTest < ActiveSupport::TestCase

  withoutkey = [{id: 1, name: "first"}, {id: 2, name: "second"}]
  withkey = [{id: 1, name: "first"}, {id: 2, name: "second", parent_id: 1}]
  withwtfkey = [{id: 1, name: "first"}, {id: 2, name: "wtf", wtf_key: 1}]
  withrandomkey = [{id: 205, name: "second", parent_id: 1}, {id: 2, name: "wtf", wtf_key: 1}]

  test "test array without parent" do
    a = withoutkey.tree
    # can't name :children, already taken by ruby, let's not break the system
    assert_equal nil, a[0][:leaves]
    assert_equal "second", a[1][:name]
    assert_equal "first", a[0][:name]
  end

  test "test array with parent" do
    a = withkey.tree
    assert_equal "second", a[0][:leaves][0][:name]
  end

  test "test array with custom foreign key" do
    a = withwtfkey.tree(:wtf_key)
    assert_equal "wtf", a[0][:leaves][0][:name]
  end

  test "test array with custom keys" do
    a = withrandomkey.tree(:wtf_key, :parent_id)
    assert_equal "wtf", a[0][:leaves][0][:name]
  end

end
