class Creature

  include CreatureActions

  def self.metaclass
    class << self
      self
    end
  end

  def self.traits( *arr )
    return @traits if arr.empty?
    attr_accessor( *arr )
    arr.each do |a|
      metaclass.instance_eval do
        define_method( a ) do |val|
          @traits ||= {}
          @traits[a] = val
        end
      end
    end
    class_eval do
      define_method( :initialize ) do
        self.class.traits.each do |k,v|
          instance_variable_set("@#{k}", v)
        end
      end
    end
  end

  traits :life, :strength, :charisma, :weapon

end