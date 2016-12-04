module UsersHelper

  def gravatar_for(user, size = 200)
    gravatar_id = Digest::MD5::hexdigest(user.email)
    gravatar_link = "https://www.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_link, alt: user.name, class: 'gravatar')
  end
end
