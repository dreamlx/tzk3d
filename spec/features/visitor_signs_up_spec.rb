# coding: utf-8
require 'spec_helper'

feature 'Visitor signs up' do
  include Features::SessionHelpers

  background do
    User.create!(:email => 'user@example.com', :password => '11111111', :password_confirmation => '11111111')
  end

end