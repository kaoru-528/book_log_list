# frozen_string_literal: true

module UserHelper
  # def gravatar_for(user, options = {size:80})
  #     size = options[:size]
  #     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  #     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  #     image_tag(gravatar_url, alt: user.name, class: "gravatar")
  # end
  def check_anonymous(user)
    if user.anonymous && !current_user?(user)
      user.name = 'Anymouse'
    else
      user.name
    end
  end
end
