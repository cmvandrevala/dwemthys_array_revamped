module CreatureActions

  def hit( damage )
    @life += magick_power_up
    @life -= damage
  end

  def fight( enemy, weapon = @weapon)
    if life <= 0
      puts "[#{ self.class } is too dead to fight!]"
      return
    end
    attack(self, enemy, weapon)
    attack(enemy, self) if enemy.life > 0
  end

  def magick_power_up
    power_up = Kernel.rand( self.charisma )
    if power_up % 9 == 7
      puts "[#{ self.class } magick powers up #{ power_up }!]"
      return power_up / 4
    end
    return 0
  end

  private

  def attack(attacker, defender, weapon = attacker.weapon)
    hit_strength = Kernel.rand( attacker.strength + weapon )
    hit_strength = 0 if attacker.strength == 0 && weapon == 0
    defender.hit( hit_strength )
    puts "[#{attacker.class} hit #{defender.class} with #{ hit_strength } points of damage!]"
    puts "[#{ self.class } has died.]" if @life <= 0
  end

end