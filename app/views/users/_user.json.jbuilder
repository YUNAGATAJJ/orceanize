# frozen_string_literal: true

json.extract! user, :id, :nichname, :email, :crypted_password, :salt, :created_at, :updated_at
json.url user_url(user, format: :json)
