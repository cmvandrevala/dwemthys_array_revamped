module CreatureActions

  def hit( damage )
    @life += magick_power_up
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

  def magick_power_up
    power_up = Kernel.rand( self.charisma )
    if power_up % 9 == 7
      puts "[#{ self.class } magick powers up #{ power_up }!]"
      return power_up / 4
    end
    return 0
  end

end