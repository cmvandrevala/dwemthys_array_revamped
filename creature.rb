class Creature

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

  def hit( damage )
    p_up = rand( charisma )
    if p_up % 9 == 7
      @life += p_up / 4
      puts "[#{ self.class } magick powers up #{ p_up }!]"
    end
    @life -= damage
    puts "[#{ self.class } has died.]" if @life <= 0
  end

  def fight( enemy, weapon )
    if life <= 0
      puts "[#{ self.class } is too dead to fight!]"
      return
    end
    your_hit = rand( strength + weapon )
    puts "[You hit with #{ your_hit } points of damage!]"
    enemy.hit( your_hit )
    p enemy
    if enemy.life > 0
      enemy_hit = rand( enemy.strength + enemy.weapon )
      puts "[Your enemy hit with #{ enemy_hit } points of damage!]"
      self.hit( enemy_hit )
    end
  end

  traits :life, :strength, :charisma, :weapon

end