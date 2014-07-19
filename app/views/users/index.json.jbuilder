json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :street, :city, :state, :zip, :home_phone, :cell_phone, :fax
  json.url user_url(user, format: :json)
end
