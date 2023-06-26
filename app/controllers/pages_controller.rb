class PagesController < ApplicationController
  def hello
    @message = 'Hello, world!'
    @sign_in_path = new_user_session_path
    @sign_up_path = new_user_registration_path
  end
end
