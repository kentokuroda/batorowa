module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
  
  def platform_image(user)
    if user.platform == "PC"
      "/images/PC.png"
    elsif user.platform == "PS4 or Xbox"
      "/images/GAME.png"
    elsif user.platform == "Switch"
      "/images/switch.png"
    else
      "/images/Mobile.png"
    end
  end
  
  def icon_image(user)
    if user.image?
      user.image.url
    else
      "/images/default.png"
    end 
  end  
end