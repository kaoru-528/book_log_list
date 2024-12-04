# frozen_string_literal: true

module UserHelper
  def check_anonymous(user)
    if user.anonymous && !current_user?(user)
      user.name = 'Anonymous'
    else
      user.name
    end
  end
end
