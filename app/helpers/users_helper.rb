module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
  
  def platform_image(user)
    if user.platform == "PC"
      "/assets/PC.png"
    elsif user.platform == "PS4 or Xbox"
      "/assets/GAME.png"
    elsif user.platform == "Switch"
      "/assets/switch.png"
    else
      "/assets/Mobile.png"
    end
  end
end