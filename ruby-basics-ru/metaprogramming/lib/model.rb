# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def attribute(name, options = {})
      @attributes ||= {}
      @attributes[name] = options

      define_method(name) do
        value = @attributes[name]
        convert_value(value, options[:type])
      end

      define_method("#{name}=") do |value|
        @attributes[name] = value
      end
    end

    def attributes
      @attributes || {}
    end
  end

  def initialize(attrs = {})
    @attributes = {}
    self.class.attributes.each_key do |attr_name|
      if attrs.key?(attr_name)
        send("#{attr_name}=", attrs[attr_name])
      end
    end
  end

  def attributes
    @attributes.each_key do |key|
      @attributes[key] = send(key)
    end
  end

  def convert_value(value, type)
    return nil if value.nil?
    case type
    when :integer
      value.to_i
    when :float
      value.to_f
    when :string
      value.to_s
    when :boolean
      !!value && value != 'false' && value != '0'
    when :datetime
      DateTime.parse(value)
    else
      value
    end
  end
end
# END