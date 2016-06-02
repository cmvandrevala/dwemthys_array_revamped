class DwemthysArray < Array

  alias _inspect inspect

  def inspect
    "#<#{ self.class }#{ _inspect }>"
  end

  def method_missing( meth, *args )
    answer = first.send( meth, *args )
    if first.life <= 0
      shift
      if empty?
        puts "[Whoa. You decimated Dwemthy's Array!]"
      else
        puts "[Get ready. #{ first.class } has emerged.]"
      end
    end
    answer || 0
  end

end