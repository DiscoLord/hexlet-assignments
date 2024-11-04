# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/stack'

class StackTest < Minitest::Test
  # BEGIN
  def test_empty
    stack = Stack.new

    assert stack.empty?
    assert_equal stack.size, 0
  end

  def test_push
    stack = Stack.new

    stack.push! "hello"

    assert_equal stack.to_a, ["hello"]
    assert_equal stack.size, 1
    refute stack.empty?
  end

  def test_pop
    stack = Stack.new
    stack.push! "hello"
    stack.push! "salut"
    stack.push! "zdravo"

    stack.pop!

    assert_equal stack.to_a, ["hello", "salut"]
    assert_equal stack.size, 2
  end

  def test_clear
    stack = Stack.new
    stack.push! "hello"
    stack.push! "salut"

    stack.clear!

    assert_empty stack.to_a
    assert stack.empty?
  end
  # END
end

test_methods = StackTest.new({}).methods.select { |method| method.start_with? 'test_' }
raise 'StackTest has not tests!' if test_methods.empty?
